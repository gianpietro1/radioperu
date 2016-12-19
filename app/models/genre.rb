class Genre < ActiveRecord::Base

  has_many :artists
  has_many :albums
  has_many :songs
  # to migrate to station
  belongs_to :radio
  # new radio:
  belongs_to :station

  translates :name

  scope :ordered_by_name, ->   { with_translations(I18n.locale).order('LOWER(name)') }

end
