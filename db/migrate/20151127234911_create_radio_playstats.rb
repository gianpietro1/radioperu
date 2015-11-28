class CreateRadioPlaystats < ActiveRecord::Migration
  def change
    create_table :radio_playstats do |t|
      t.integer :song_id
      t.datetime :listened_at
      t.string :ip_address
      t.string :platform
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
