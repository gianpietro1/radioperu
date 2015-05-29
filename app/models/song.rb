class Song < ActiveRecord::Base

  translates :review
  belongs_to :album
  belongs_to :artist

  mount_uploader :filename, FilenameUploader

end