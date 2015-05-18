class Album < ActiveRecord::Base

  attr_accessor :song_num

  has_many :songs
  accepts_nested_attributes_for :songs, :reject_if => :all_blank, :allow_destroy => true
  belongs_to :user
  belongs_to :artist
  
  translates :review, :format

  mount_uploader :cover, CoverUploader

  def song_num
    @song_num || 5
  end

  def add_song_new
    self.song_num += 1
  end

end
