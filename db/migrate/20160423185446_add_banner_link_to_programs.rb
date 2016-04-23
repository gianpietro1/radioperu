class AddBannerLinkToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :banner_link, :string
  end
end
