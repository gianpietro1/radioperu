class FixArtists < ActiveRecord::Migration
  def change
    change_table :artists do |t|
      t.rename :url, :external_url
    end
  end
end
