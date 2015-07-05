class CreateGenres < ActiveRecord::Migration

  def up
    create_table :genres do |t|
      t.integer :radio_id
    end
      Genre.create_translation_table! :name => :string
  end

  def down
    drop_table :genres
    Genre.drop_translation_table!
  end

end