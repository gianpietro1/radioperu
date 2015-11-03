class AddPrivateToPlaylists < ActiveRecord::Migration
  def change
    add_column :playlists, :private, :boolean, :default => false
  end
end
