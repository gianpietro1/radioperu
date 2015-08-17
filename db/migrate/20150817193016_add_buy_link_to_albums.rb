class AddBuyLinkToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :buylink, :string
  end
end
