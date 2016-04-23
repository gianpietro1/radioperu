class AddBannerIphoneToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :banner_iphone, :string
  end
end
