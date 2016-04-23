class AddBannerUrlToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :banner_url, :string
  end
end
