class Appointment < ApplicationRecord


  belongs_to :patient, required: true
  belongs_to :user, required: true
  has_many :notes, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :treatments, dependent: :destroy


end
