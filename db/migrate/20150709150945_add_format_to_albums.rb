class AddFormatToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :format_id, :integer
  end
end
