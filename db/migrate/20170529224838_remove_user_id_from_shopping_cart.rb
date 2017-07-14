class RemoveUserIdFromShoppingCart < ActiveRecord::Migration[5.0]
  def change
    remove_column :shopping_carts, :user_id
  end
end
