class AddIndexToArtistViewstats < ActiveRecord::Migration
  def change
    add_index :artist_viewstats, :artist_id
  end
end
