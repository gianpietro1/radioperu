class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :artists

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