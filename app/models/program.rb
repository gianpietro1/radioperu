class Program < ActiveRecord::Base

  default_scope  { order('program_start ASC') }

  translates :name, :description, :banner
  belongs_to :radio

  mount_uploader :image, ProgramImageUploader
  mount_uploader :banner, BannerUploader


end
