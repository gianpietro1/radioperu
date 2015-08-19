class Artist < ActiveRecord::Base

  default_scope  { order('LOWER(name)') }
  
  autocomplete :name, :score => :id
  before_validation :smart_add_url_protocol
  
  translates :bio

  belongs_to :user
  belongs_to :genre
  has_many :albums, dependent: :destroy
  has_many :songs, :through => :albums, dependent: :destroy
  
  mount_uploader :image, ImageUploader

  after_update :send_update_email

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

protected

  def smart_add_url_protocol
    unless self.external_url.nil? || self.external_url.empty?
      unless self.external_url[/\Ahttp:\/\//] || self.external_url[/\Ahttps:\/\//]
        self.external_url = "http://#{self.external_url}"
      end
    end
  end

  def send_update_email
    UpdatesMailer.new_artist_update(self).deliver
  end


end
