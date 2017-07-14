class CreateAvatars < ActiveRecord::Migration[5.0]
  def change
    create_table :avatars do |t|
      t.integer :product_id, foreign_key: true

      t.timestamps
    end
  end
end
