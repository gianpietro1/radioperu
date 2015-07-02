class Song < ActiveRecord::Base

  autocomplete :name, :score => :id

  translates :review
  belongs_to :album
  belongs_to :artist
  has_and_belongs_to_many :genres

  mount_uploader :filename, FilenameUploader

  def id3
    
  end

end