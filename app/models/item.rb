class Item < ApplicationRecord
  validates :name, presence: true 
  validates :description, presence: true 
  validates :price, presence: true , numericality: { message: "must be a number" }
end
