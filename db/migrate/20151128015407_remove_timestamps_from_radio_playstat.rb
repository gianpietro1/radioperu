class RemoveTimestampsFromRadioPlaystat < ActiveRecord::Migration
  def change
    remove_column :radio_playstats, :created_at, :string
    remove_column :radio_playstats, :updated_at, :string
  end
end
