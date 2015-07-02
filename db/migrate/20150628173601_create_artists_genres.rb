class CreateArtistsGenres < ActiveRecord::Migration
  def change
    create_table :artists_genres, :id => false do |t|
      t.references :genre
      t.references :artist
    end
  end
end
