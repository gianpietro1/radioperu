class Album < ActiveRecord::Base

  autocomplete :name, :score => :id

  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs, :reject_if => :all_blank, :allow_destroy => true
  belongs_to :artist
  belongs_to :genre
  belongs_to :format
  belongs_to :user
  validates :name, length: {minimum: 2}
  validates_format_of :name, {:without => /\//}

  translates :review

  mount_uploader :cover, CoverUploader

  before_validation :smart_add_url_protocol

  after_save :change_folder_if_changed

  default_scope { order('year ASC') }

  extend FriendlyId
  friendly_id :name, :use => :scoped, :scope => :artist

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
  
  def prev(array,artist)
    if array[array.index(artist.albums.find(id).id) - 1]
      artist.albums.find(array[array.index(artist.albums.find(id).id) - 1])
    else
      artist.albums.find(array[array.count - 1])
    end
  end

  def next(array,artist)
    if array[array.index(artist.albums.find(id).id) + 1]
      artist.albums.find(array[array.index(artist.albums.find(id).id) + 1])
    else
      artist.albums.find(array[0])
    end
  end

  def send_update_email
    UpdatesMailer.new_album_update(self.artist,self).deliver
  end

  def change_folder_if_changed
    if self.name_changed?
      album_old = self.name_was
      system("mkdir 'public/uploads/song/#{self.artist.name.to_s}/#{self.name.to_s}'")
      self.songs.each do |song|
       system("mv 'public/uploads/song/#{song.album.artist.name.to_s}/#{album_old}/#{song.filename.file.basename}.mp3' '#{song.filename.file.file}'")
      end
    end
  end
  
 protected

  def smart_add_url_protocol
    unless self.buylink.nil? || self.buylink.empty?
      unless self.buylink[/\Ahttp:\/\//] || self.buylink[/\Ahttps:\/\//]
        self.buylink = "http://#{self.buylink}"
      end
    end
  end

end
