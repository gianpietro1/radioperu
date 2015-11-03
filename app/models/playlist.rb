class Playlist < ActiveRecord::Base
  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs
  belongs_to :user

  mount_uploader :image, PlaylistUploader


def length
  @length = 0
  self.songs.each do |song|
    songpath = song.filename.file.file
    TagLib::FileRef.open(songpath) do |fileref|
      unless fileref.null?
        properties = fileref.audio_properties
        @length = @length + properties.length
      end
    end
  end
  return (@length/60).to_s
end

end