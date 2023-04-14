class PatientPharmacy < ApplicationRecord


  belongs_to :patient, required: true
  belongs_to :pharmacy, required: true


end
