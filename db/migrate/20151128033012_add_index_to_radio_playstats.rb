class AddIndexToRadioPlaystats < ActiveRecord::Migration
  def change
    add_index :radio_playstats, :song_id
  end
end
