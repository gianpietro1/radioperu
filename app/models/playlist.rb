class Playlist < ActiveRecord::Base
  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs
  belongs_to :user

  mount_uploader :image, PlaylistUploader

end