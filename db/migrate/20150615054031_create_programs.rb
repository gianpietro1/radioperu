class CreatePrograms < ActiveRecord::Migration
  
  def up
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.string :image
      t.integer :radio_id, index: true
      t.time :program_start
      t.time :program_end
      t.string :banner
      t.text :days_array
    end
    Program.create_translation_table! :name => :string, :description => :text, :banner => :string
  end

  def down
    drop_table :programs
    Program.drop_translation_table!
  end

end