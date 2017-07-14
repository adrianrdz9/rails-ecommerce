class DefineDefaultStockInProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :stock
    add_column :products, :stock, :integer, default: 1
  end
end
