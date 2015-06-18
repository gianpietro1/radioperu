class Program < ActiveRecord::Base
  translates :name, :description, :banner
  belongs_to :radio

  mount_uploader :image, ProgramImageUploader
  mount_uploader :banner, BannerUploader


end