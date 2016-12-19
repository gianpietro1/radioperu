class CreateStations < ActiveRecord::Migration

  def up
    create_table :stations do |t|
      t.string :listenurl
      t.string :color
      t.timestamps null:false
    end
    Station.create_translation_table! :name => :string, :description => :string
  end

  def down
    drop_table :stations
    Station.drop_translation_table!
  end


end
