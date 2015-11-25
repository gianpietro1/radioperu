class CreatePlaylistPlaystats < ActiveRecord::Migration
  def change
    create_table :playlist_playstats do |t|
      t.integer :song_id
      t.datetime :listened_at
      t.string :ip_address
      t.string :platform
      t.integer :user_id
    end
  end
end
