class Artist < ActiveRecord::Base

  translates :bio

  mount_uploader :image, ImageUploader

end
