class User < ApplicationRecord

  has_many :appointments
  has_many :notes
  has_many :prescriptions
  has_many :treatments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
