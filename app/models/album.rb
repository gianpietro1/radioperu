class Album < ActiveRecord::Base

  autocomplete :name, :score => :id

  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs, :reject_if => :all_blank, :allow_destroy => true
  belongs_to :artist
  belongs_to :genre
  belongs_to :format
  belongs_to :user

  translates :review

  mount_uploader :cover, CoverUploader

  default_scope { order('year ASC') }

  extend FriendlyId
  friendly_id :name, :use => :slugged

  def next(array,artist)
    if artist.albums.exists?(id + 1)
      artist.albums.find(array[array.index(artist.albums.find(id).id) + 1]) 
    else
      artist.albums.find(array[0])
    end
  end

end
