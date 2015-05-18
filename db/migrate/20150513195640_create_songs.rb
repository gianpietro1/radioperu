class CreateSongs < ActiveRecord::Migration

  def up
    create_table :songs do |t|
      t.integer :album_id
      t.integer :discnum
      t.integer :track
      t.string :name
      t.string :filename
      t.string :length
      t.text :lyrics
      t.string :video
      t.timestamps null: false
    end
      Song.create_translation_table! :review => :text
    end

  def down
    drop_table :songs
    Song.drop_translation_table!
  end

end