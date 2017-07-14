class RemoveAttachmentsFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :products, :avatar
  end
end
