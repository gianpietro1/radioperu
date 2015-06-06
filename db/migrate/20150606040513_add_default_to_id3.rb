class AddDefaultToId3 < ActiveRecord::Migration
  def change
    rename_column :songs, :length, :id3
    change_column :songs, :id3, 'boolean USING CAST(id3 AS boolean)'
    change_column_default(:songs, :id3, false)
  end
end