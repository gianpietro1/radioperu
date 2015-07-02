class Artist < ActiveRecord::Base

  autocomplete :name, :score => :id
  
  translates :bio
  accepts_nested_attributes_for :genres, :reject_if => :all_blank, :allow_destroy => true

  belongs_to :user
  has_many :albums, dependent: :destroy
  has_many :songs, :through => :albums, dependent: :destroy
  has_and_belongs_to_many :genres
  
  mount_uploader :image, ImageUploader

end
