class Artist < ActiveRecord::Base

  default_scope  { order('LOWER(name)') }
  
  autocomplete :name, :score => :id
  
  translates :bio

  belongs_to :user
  belongs_to :genre
  has_many :albums, dependent: :destroy
  has_many :songs, :through => :albums, dependent: :destroy
  
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
