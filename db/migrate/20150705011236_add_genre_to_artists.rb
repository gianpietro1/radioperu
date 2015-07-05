class AddGenreToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :genre_id, :integer
  end
end
