class Program < ActiveRecord::Base

  default_scope  { order('program_start ASC') }

  translates :name, :description, :banner
  # to migrate to station
  belongs_to :radio
  # new radio:
  belongs_to :station

  mount_uploader :image, ProgramImageUploader
  mount_uploader :banner, BannerUploader
  mount_uploader :banner_android, BannerAndroidUploader
  mount_uploader :banner_iphone, BannerIphoneUploader
  mount_uploader :banner_ipad, BannerIpadUploader

end
