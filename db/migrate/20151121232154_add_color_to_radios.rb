class AddColorToRadios < ActiveRecord::Migration
  def change
    add_column :radios, :color, :string
  end
end
