class Artist < ActiveRecord::Base

  autocomplete :name, :score => :id
  
  translates :bio
  belongs_to :user
  has_many :albums, dependent: :destroy
  has_many :songs, :through => :albums, dependent: :destroy

  mount_uploader :image, ImageUploader

end
