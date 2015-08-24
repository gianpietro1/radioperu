class Genre < ActiveRecord::Base

  has_many :artists
  has_many :albums
  has_many :songs
  belongs_to :radio

  translates :name

  scope :ordered_by_name, ->   { with_translations(I18n.locale).order('LOWER(name)') }

end
