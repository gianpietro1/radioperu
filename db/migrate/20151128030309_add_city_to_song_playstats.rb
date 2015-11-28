class AddCityToSongPlaystats < ActiveRecord::Migration
  def change
    add_column :song_playstats, :city, :string
    add_column :song_playstats, :country, :string
  end
end
