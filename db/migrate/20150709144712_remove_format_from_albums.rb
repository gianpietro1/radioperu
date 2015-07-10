class RemoveFormatFromAlbums < ActiveRecord::Migration

  def down
    remove_column :albums, :format
    remove_column :album_translations, :format
  end

end
