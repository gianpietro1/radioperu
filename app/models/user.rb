class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  before_create :generate_auth_token
  
  has_many :artists
  has_many :albums
  has_many :songs
  has_many :playlists, dependent: :destroy
  
  def self.from_omniauth(auth)
    if self.where(email: auth.info.email).exists?
      user = self.where(email: auth.info.email).first
      user.provider = auth.provider
      user.uid = auth.uid
      user.save!
    else
      where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name = auth.info.name
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.skip_confirmation!
        user.save!
      end
    end
  end

  def admin?
    role == 'admin'
  end
  
  def musician?
    role == 'musician'
  end

  def listener?
    role == 'listener'
  end

  def generate_auth_token
   loop do
    self.auth_token = SecureRandom.base64(64)
    break unless User.find_by(auth_token: auth_token)
   end
  end

end