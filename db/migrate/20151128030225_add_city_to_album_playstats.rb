class AddCityToAlbumPlaystats < ActiveRecord::Migration
  def change
    add_column :album_playstats, :city, :string
    add_column :album_playstats, :country, :string
  end
end
