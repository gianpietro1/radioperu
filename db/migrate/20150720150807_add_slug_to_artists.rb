class AddSlugToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :slug, :string
    add_index :artists, :slug
  end
end
