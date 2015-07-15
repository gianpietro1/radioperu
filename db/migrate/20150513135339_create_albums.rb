class CreateAlbums < ActiveRecord::Migration

  def up
    create_table :albums do |t|
      t.string :name
      t.integer :year
      t.string :cover
      t.timestamps null: false
    end
      Album.create_translation_table! :review => :text
  end

  def down
    drop_table :albums
    Album.drop_translation_table!
  end

end