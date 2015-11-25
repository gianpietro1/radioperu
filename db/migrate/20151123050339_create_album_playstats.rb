class CreateAlbumPlaystats < ActiveRecord::Migration
  def change
    create_table :album_playstats do |t|
      t.integer :song_id, index: true
      t.datetime :listened_at
      t.string :ip_address
      t.string :platform
      t.integer :user_id

      t.timestamps null: true
    end
  end
end
