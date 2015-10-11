class Radio < ActiveRecord::Base
  translates :name, :description
  has_many :programs, dependent: :destroy
  has_many :genres
  has_many :artists, :through => :genres

    default_scope  { order('id ASC') }

end