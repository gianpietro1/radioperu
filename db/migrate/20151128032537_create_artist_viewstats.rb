class CreateArtistViewstats < ActiveRecord::Migration
  def change
    create_table :artist_viewstats do |t|
      t.integer :artist_id
      t.datetime :viewed_at
      t.string :ip_address
      t.string :platform
      t.integer :user_id
      t.string :city
      t.string :country
    end
  end
end
