class AddArtistToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :artist_id, :integer
  end
end
