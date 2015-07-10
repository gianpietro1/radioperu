class CreateFormats < ActiveRecord::Migration
  
  def up
    create_table :formats do |t|
    end
    Format.create_translation_table! :name => :string
  end

  def down
    drop_table :formats
    Format.drop_translation_table!
  end

end