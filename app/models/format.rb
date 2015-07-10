class Format < ActiveRecord::Base

  has_many :albums

  translates :name

end
