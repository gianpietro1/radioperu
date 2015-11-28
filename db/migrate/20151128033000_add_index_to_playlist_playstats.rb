class AddIndexToPlaylistPlaystats < ActiveRecord::Migration
  def change
    add_index :playlist_playstats, :song_id
  end
end
