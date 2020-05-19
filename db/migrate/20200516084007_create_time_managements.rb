class CreateTimeManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :time_managements do |t|
      t.string :time_zone
      t.boolean :reserved

      t.timestamps
    end
  end
end
