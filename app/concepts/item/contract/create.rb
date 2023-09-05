module Item::Contract
  class Create < Reform::Form
    byebug
    property :name
    property :description
    property :price
    property :avatar

    validates :name, presence: true 
    validates :description, presence: true 
    validates :price, presence: true , numericality: { message: "must be a number" }
  end
end
