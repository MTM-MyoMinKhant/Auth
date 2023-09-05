class Item < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  validates :name, presence: true 
  validates :description, presence: true 
  validates :price, presence: true , numericality: { message: "must be a number" }
end
