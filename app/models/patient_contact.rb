class PatientContact < ApplicationRecord


  belongs_to :patient, required: true


end
