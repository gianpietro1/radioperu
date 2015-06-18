class Radio < ActiveRecord::Base
  translates :name, :description
  has_many :programs, dependent: :destroy
end