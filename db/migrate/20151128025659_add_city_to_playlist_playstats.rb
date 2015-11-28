class AddCityToPlaylistPlaystats < ActiveRecord::Migration
  def change
    add_column :playlist_playstats, :city, :string
    add_column :playlist_playstats, :country, :string
  end
end
