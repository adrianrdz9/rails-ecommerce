# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  pricing     :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stock       :integer
#  category    :string
#

class Product < ApplicationRecord
  belongs_to :user
  has_many :avatars
  has_many :in_shopping_carts
  has_many :shopping_carts, through: :in_shopping_carts

  validates_presence_of :title, :description
  validates :pricing, numericality: {greater_than: 0}
  validates :stock, numericality: {greater_than: -1}

end
