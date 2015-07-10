class Album < ActiveRecord::Base

  autocomplete :name, :score => :id

  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs, :reject_if => :all_blank, :allow_destroy => true
  belongs_to :artist
  belongs_to :genre
  belongs_to :format

  translates :review

  mount_uploader :cover, CoverUploader

  default_scope { order('year ASC') }

end
