class AddAvatarToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :avatar, :string
  end
end
