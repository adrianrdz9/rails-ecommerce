# == Schema Information
#
# Table name: avatars
#
#  id                 :integer          not null, primary key
#  product_id         :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Avatar < ApplicationRecord
  belongs_to :product

  has_attached_file :image, styles: { medium: "300x300", thumb: "100x100" }, default_url: "missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
