class Diagnosis < ApplicationRecord

  has_many :prescriptions, dependent: :destroy
  has_many :treatments, dependent: :destroy



end
