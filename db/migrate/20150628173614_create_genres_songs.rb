class CreateGenresSongs < ActiveRecord::Migration
  def change
    create_table :genres_songs, :id => false do |t|
      t.references :genre
      t.references :song
    end
  end
end
