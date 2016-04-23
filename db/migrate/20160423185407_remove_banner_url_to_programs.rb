class RemoveBannerUrlToPrograms < ActiveRecord::Migration
  def change
    remove_column :programs, :banner_url, :string
  end
end
