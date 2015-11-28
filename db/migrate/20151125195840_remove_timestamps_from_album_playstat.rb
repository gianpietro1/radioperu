class RemoveTimestampsFromAlbumPlaystat < ActiveRecord::Migration
  def change
    remove_column :album_playstats, :created_at, :string
    remove_column :album_playstats, :updated_at, :string
  end
end
