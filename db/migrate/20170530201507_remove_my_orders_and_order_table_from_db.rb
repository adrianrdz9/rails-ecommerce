class RemoveMyOrdersAndOrderTableFromDb < ActiveRecord::Migration[5.0]
  def change
    drop_table :my_orders
    drop_table :orders
  end
end
