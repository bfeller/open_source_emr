class Pharmacy < ApplicationRecord
  has_rich_text :notes

  has_many :patient_pharmacies, dependent: :destroy
  has_many :patients, through: :patient_pharmacies

end
