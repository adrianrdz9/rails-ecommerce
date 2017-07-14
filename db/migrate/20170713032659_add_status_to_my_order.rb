class AddStatusToMyOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :my_orders, :status, :integer, default: 0
  end
end
