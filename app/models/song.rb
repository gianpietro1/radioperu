class Song < ActiveRecord::Base

  autocomplete :name, :score => :id

  translates :review
  belongs_to :album
  belongs_to :artist

  mount_uploader :filename, FilenameUploader

  def id3
    
  end

end