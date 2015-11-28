class AddIndexToSongPlaystats < ActiveRecord::Migration
  def change
    add_index :song_playstats, :song_id
  end
end
