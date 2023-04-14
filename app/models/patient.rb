class Patient < ApplicationRecord


  belongs_to :user, required: false
  has_many :patient_pharmacies, dependent: :destroy
  has_many :pharmacies, through: :patient_pharmacies
  has_many :appointments, dependent: :destroy
  has_many :patient_contacts, dependent: :destroy
  has_many :prescriptions, dependent: :destroy


  def self.has_many_relationships
    return []
  end

end
