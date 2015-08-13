class Song < ActiveRecord::Base

  after_save :inherit_genre_and_user, :update_id3

  autocomplete :name, :score => :id

  translates :review
  belongs_to :album
  belongs_to :genre
  belongs_to :user

  mount_uploader :filename, FilenameUploader

  default_scope { order('discnum ASC', 'track ASC') }


  extend FriendlyId
  friendly_id :name, :use => :scoped, :scope => :album

  def should_generate_new_friendly_id?
    true
  end

  private

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