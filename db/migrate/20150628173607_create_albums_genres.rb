class CreateAlbumsGenres < ActiveRecord::Migration
  def change
    create_table :albums_genres, :id => false do |t|
      t.references :genre
      t.references :album
    end
  end
end
