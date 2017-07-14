class AddEmailToMyOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :my_orders, :email, :string
  end
end
