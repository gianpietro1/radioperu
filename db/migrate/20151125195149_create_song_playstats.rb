class CreateSongPlaystats < ActiveRecord::Migration
  def change
    create_table :song_playstats do |t|
      t.integer :song_id
      t.datetime :listened_at
      t.string :ip_address
      t.string :platform
      t.integer :user_id
    end
  end
end
