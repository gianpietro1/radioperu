class AddDefaultToUserRole < ActiveRecord::Migration
  def change
    change_column_default(:users, :role, 'listener')
  end
end
