class CreateAlbumViewstats < ActiveRecord::Migration
  def change
    create_table :album_viewstats do |t|
      t.integer :album_id
      t.datetime :viewed_at
      t.string :ip_address
      t.string :platform
      t.integer :user_id
      t.string :city
      t.string :country
    end
    add_index :album_viewstats, :album_id
  end
end
