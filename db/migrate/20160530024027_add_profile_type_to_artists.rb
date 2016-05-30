class AddProfileTypeToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :profile_type, :string, :default => 'musician'
  end
end
