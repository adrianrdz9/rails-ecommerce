class CreateShoppingCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_carts do |t|
      t.integer :status, default: 0
      t.string :ip
      t.integer :user_id, nullable: true

      t.timestamps
    end
  end
end
