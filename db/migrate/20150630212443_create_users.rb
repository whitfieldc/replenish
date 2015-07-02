class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :auth_id
      t.float :shopping_freq
      t.datetime :recent_trip
      t.integer :total_trips, default: 0

      t.timestamps null: false
    end
  end
end
