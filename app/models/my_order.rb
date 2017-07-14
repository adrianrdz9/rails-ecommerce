# == Schema Information
#
# Table name: my_orders
#
#  id               :integer          not null, primary key
#  shopping_cart_id :integer
#  total            :integer
#  permanent_link   :string
#  recipient_name   :string
#  line1            :string
#  line2            :string
#  city             :string
#  country_code     :string
#  postal_code      :string
#  phone            :string
#  state            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  email            :string
#  status           :integer          default("0")
#

class MyOrder < ApplicationRecord
  belongs_to :shopping_cart

  enum status: {created: 0, completed: 1}
end
