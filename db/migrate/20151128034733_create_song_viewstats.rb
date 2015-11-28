class CreateSongViewstats < ActiveRecord::Migration
  def change
    create_table :song_viewstats do |t|
      t.integer :song_id
      t.datetime :viewed_at
      t.string :ip_address
      t.string :platform
      t.integer :user_id
      t.string :city
      t.string :country
    end
    add_index :song_viewstats, :song_id
  end
end
