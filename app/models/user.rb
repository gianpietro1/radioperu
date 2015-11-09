class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :registerable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
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

  has_many :artists
  has_many :albums
  has_many :songs
  has_many :playlists, dependent: :destroy
  
  def admin?
    role == 'admin'
  end
  
  def musician?
    role == 'musician'
  end

  def listener?
    role == 'listener'
  end

end