class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable , :confirmable
  validates :name, presence: true 
  validates :age, presence: true , numericality: { message: "must be a number" }
  validates :role, presence: true , numericality: { message: "must be a number" }
  
  def admin?
    role == 0
  end
end
