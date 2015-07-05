class AddGenreToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :genre_id, :integer
  end
end
