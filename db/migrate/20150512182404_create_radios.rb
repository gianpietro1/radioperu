class CreateRadios < ActiveRecord::Migration
  
  def up
    create_table :radios do |t|
      t.string :player
      t.string :host
      t.integer :port
      t.timestamps null:false
    end
    Radio.create_translation_table! :name => :string, :description => :string
  end

  def down
    drop_table :posts
    Radio.drop_translation_table!
  end

end