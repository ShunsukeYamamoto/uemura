class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name,null: false
      t.string :address, null: false
      t.integer :tel, null: false
      t.integer :total_price, null: false,default: 0
      t.boolean :done, default: false
      t.integer :time_management_id

      t.timestamps
    end
  end
end
