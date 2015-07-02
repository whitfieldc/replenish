class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      # t.string :api_id
      t.string :category
      t.integer :shelf_life_days, default: 14

      t.timestamps null: false
    end
  end
end
