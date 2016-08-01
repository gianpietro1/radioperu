class Song < ActiveRecord::Base

  require 'taglib'

  after_save :inherit_genre_and_user, :update_id3, :encode128

  before_validation :smart_add_url_protocol

  autocomplete :name, :score => :id

  translates :review
  belongs_to :album
  belongs_to :genre
  belongs_to :user
  belongs_to :artist
  delegate :artist, :to => :album, :allow_nil => true
  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :playlist_playstats, dependent: :destroy
  has_many :album_playstats, dependent: :destroy
  has_many :song_playstats, dependent: :destroy
  has_many :radio_playstats, dependent: :destroy

  mount_uploader :filename, FilenameUploader
  validates_presence_of :filename, :message => "Todas las canciones deben tener un archivo MP3 asociado. Por favor vuelve a especificar todos los archivos nuevos."

  default_scope { order('discnum ASC', 'track ASC') }

  #scope :top5,
  #  select("songs.id, OTHER_ATTRS_YOU_NEED, count(listens.id) AS listens_count").
  #  joins(:listens).
  #  group("songs.id").
  #  order("listens_count DESC").
  #  limit(5)

  extend FriendlyId
  friendly_id :name, :use => :scoped, :scope => :album

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def send_update_email
    UpdatesMailer.new_song_update(self.album.artist,self).deliver
  end

  def add_to_playlist(playlist_id)
    PlaylistSong.create(playlist_id: playlist_id, song_id: self.id)
  end

  def remove_from_playlist(playlist_id)
    PlaylistSong.where(playlist_id: playlist_id, song_id: self.id).delete_all
  end

  def views
    SongViewstat.where(song_id: self.id).count
  end


  private

    def smart_add_url_protocol
      unless self.video.nil? || self.video.empty?
        unless self.video[/\Ahttp:\/\//] || self.video[/\Ahttps:\/\//]
          self.video = "http://#{self.video}"
        end
      end
    end

    def encode128
        songpath = self.filename.file.file

        TagLib::FileRef.open(songpath) do |fileref|
          unless fileref.null?
            properties = fileref.audio_properties
            if properties.bitrate != 128
              system("avconv -i '#{songpath}' -c:a libmp3lame -y -vn -b:a 128k -vsync 2 '#{songpath[0..-5] + '-temp' + '.mp3'}'")
              system("mv '#{songpath[0..-5] + '-temp' + '.mp3'}' '#{songpath}'")
            end
          end
        end
    end

    def inherit_genre_and_user
      if self.genre_id == nil
        if album.genre_id
          self.update_attributes(genre_id: album.genre_id)
        elsif self.album.artist.genre_id
          self.update_attributes(genre_id: album_artist.genre_id)
        end
      end
      if self.user_id == nil
        self.update_attributes(user_id: self.album.user_id)
      end
    end

   def update_id3

    if self.id3 == true

      mp3_path = open(self.filename.path.to_s, "rb")
      @id3tags = ID3Tag.read(mp3_path)

      song_hash = {}

      if @id3tags.title
        song_hash[:name] = @id3tags.title
      else
        song_hash[:name] = ''
      end

      if @id3tags.get_frames(:TRCK)
        if @id3tags.get_frames(:TRCK).first
          song_hash[:track] = @id3tags.get_frames(:TRCK).first.content
        elsif @id3tags.get_frames(:TRCK).last
          song_hash[:track] = @id3tags.get_frames(:TRCK).last.content
        else
          song_hash[:track] = 1
        end
      end

      if @id3tags.get_frames(:TPOS)
        if @id3tags.get_frames(:TPOS).first
          song_hash[:discnum] = @id3tags.get_frames(:TPOS).first.content
        elsif @id3tags.get_frames(:TPOS).last
          song_hash[:discnum] = @id3tags.get_frames(:TPOS).last.content
        else
          song_hash[:discnum] = 1
        end
      end

      self.update_attributes(id3: false, name: song_hash[:name], track: song_hash[:track], discnum: song_hash[:discnum])

    end
  end

end