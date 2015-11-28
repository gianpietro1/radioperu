class AddCityToRadioPlaystats < ActiveRecord::Migration
  def change
    add_column :radio_playstats, :city, :string
    add_column :radio_playstats, :country, :string
  end
end
