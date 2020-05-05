class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :user_id
      t.string :shipping_address
      t.integer :total_cost
      t.string :order_number
      t.string :item
      t.string :state


      t.timestamps
    end
  end
end
