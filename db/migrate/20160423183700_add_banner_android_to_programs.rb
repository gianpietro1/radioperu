class AddBannerAndroidToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :banner_android, :string
  end
end
