class CreateRadios < ActiveRecord::Migration
  def change
    create_table :radios do |t|
      t.string :name
      t.string :description
      t.string :host
      t.integer :port

      t.timestamps null: false
    end
  end
end
