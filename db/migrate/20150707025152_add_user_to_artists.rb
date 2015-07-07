class AddUserToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :user_id, :integer
  end
end
