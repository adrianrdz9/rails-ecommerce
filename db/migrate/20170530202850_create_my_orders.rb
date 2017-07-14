class CreateMyOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :my_orders do |t|
      t.references :shopping_cart, foreign_key: true
      t.integer :total
      t.string :permanent_link
      t.string :recipient_name
      t.string :line1
      t.string :line2
      t.string :city
      t.string :country_code
      t.string :postal_code
      t.string :phone
      t.string :state

      t.timestamps
    end
  end
end
