class CreateFoodOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :food_orders do |t|
      t.references :food,  foreign_key: true
      t.references :order, foreign_key: true
      t.integer :count, null: false, default: 0
      t.string :taste

      t.timestamps
    end
  end
end
