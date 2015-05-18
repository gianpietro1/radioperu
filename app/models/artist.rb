class Artist < ActiveRecord::Base

  translates :bio
  belongs_to :user
  has_many :albums
  has_many :songs, :through => :albums

  mount_uploader :image, ImageUploader

end
