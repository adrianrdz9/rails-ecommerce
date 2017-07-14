# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :integer          default("0")
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord
  has_many :in_shopping_carts
  has_many :products, through: :in_shopping_carts


  enum status: {payed: 1, created: 0}

  def total
    total = 0
    self.in_shopping_carts.each do |i_sh|
      total += i_sh.product.pricing * i_sh.quantity
    end

    if total >= 1000
      return total

    else
      return total + 150
    end

  end

  def subtotal
    subtotal = 0
    self.in_shopping_carts.each do |i_sh|
      subtotal += i_sh.product.pricing * i_sh.quantity
    end
    return subtotal
  end

  def shipping_discount
    return self.total != self.subtotal ? 0 : 150
  end

  def items
    arr = []
    self.products.each do |product|
      arr << {name: product.title, sku: product.id, price: product.pricing, currency: "MXN", quantity: self.in_shopping_carts.find_by(product_id: product.id).quantity}
    end
    return arr
  end

end
