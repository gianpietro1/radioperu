class CreatePlaylistViewstats < ActiveRecord::Migration
  def change
    create_table :playlist_viewstats do |t|
      t.integer :playlist_id
      t.datetime :viewed_at
      t.string :ip_address
      t.string :platform
      t.integer :user_id
      t.string :city
      t.string :country
    end
    add_index :playlist_viewstats, :playlist_id
  end
end
