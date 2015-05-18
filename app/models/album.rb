class Album < ActiveRecord::Base

  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs, :reject_if => :all_blank, :allow_destroy => true
  belongs_to :user
  belongs_to :artist
  
  translates :review, :format

  mount_uploader :cover, CoverUploader

end
