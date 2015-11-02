class AddImageToPlaylist < ActiveRecord::Migration
  def change
    add_column :playlists, :image, :string
  end
end
