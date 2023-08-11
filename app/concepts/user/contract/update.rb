module User::Contract
  class Update < Reform::Form
    property :name
    property :age

    validates :name, presence: true 
    validates :age, presence: true , numericality: { message: "must be a number" }
  end
end
