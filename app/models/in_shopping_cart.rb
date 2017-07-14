# == Schema Information
#
# Table name: in_shopping_carts
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  shopping_cart_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  quantity         :integer          default("1")
#

class InShoppingCart < ApplicationRecord
  belongs_to :shopping_cart
  belongs_to :product
end
