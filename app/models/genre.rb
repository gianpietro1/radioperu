class Genre < ActiveRecord::Base

  has_many :artists
  has_many :albums
  has_many :songs
  belongs_to :radio

  translates :name

end
