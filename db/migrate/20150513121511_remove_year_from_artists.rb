class RemoveYearFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :year, :integer
  end
end
