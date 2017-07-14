class AddAvatarToProducts < ActiveRecord::Migration[5.0]
  def change
    add_attachment :products, :avatar
  end
end
