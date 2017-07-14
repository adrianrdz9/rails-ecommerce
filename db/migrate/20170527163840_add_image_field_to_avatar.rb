class AddImageFieldToAvatar < ActiveRecord::Migration[5.0]
  def change
    add_attachment :avatars, :image
  end
end
