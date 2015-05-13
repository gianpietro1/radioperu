class CreateArtists < ActiveRecord::Migration

  def up
      create_table :artists do |t|
        t.string :name
        t.string :image
        t.integer :year
        t.string :city
        t.string :url
        t.boolean :active, default: 1
        t.timestamps null: false
    end
      Artist.create_translation_table! :bio => :text
  end

  def down
    drop_table :artists
    Artist.drop_translation_table!
  end

end