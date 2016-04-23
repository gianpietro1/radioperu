class AddBannerIpadToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :banner_ipad, :string
  end
end
