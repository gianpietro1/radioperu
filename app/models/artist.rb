class Artist < ActiveRecord::Base

  default_scope  { order('LOWER(name)') }

  autocomplete :name, :score => :id
  before_validation :smart_add_url_protocol
  
  translates :bio

  belongs_to :user
  belongs_to :genre
  has_many :albums, dependent: :destroy
  has_many :songs, :through => :albums, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  
  mount_uploader :image, ImageUploader

  extend FriendlyId
  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

  def send_update_email
    UpdatesMailer.new_artist_update(self).deliver
  end

  def latest_album_update
    array = []
    self.albums.map do |album|
      array << album.updated_at
    end
    return array.max
  end

  def views
    ArtistViewstat.where(artist_id: self.id).count
  end

protected

  def smart_add_url_protocol
    unless self.external_url.nil? || self.external_url.empty?
      unless self.external_url[/\Ahttp:\/\//] || self.external_url[/\Ahttps:\/\//]
        self.external_url = "http://#{self.external_url}"
      end
    end
    unless self.social_fb.nil? || self.social_fb.empty?
      if self.social_fb.include? "?"
        self.social_fb = self.social_fb.slice(0..(self.social_fb.index('?')-1))
      end
      self.social_fb = self.social_fb.chomp('/')        
    end
  end


end
