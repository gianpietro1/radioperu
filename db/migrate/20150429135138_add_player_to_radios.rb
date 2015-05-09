class AddPlayerToRadios < ActiveRecord::Migration
  def change
    add_column :radios, :player, :string
  end
end
