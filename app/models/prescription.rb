class Prescription < ApplicationRecord


  belongs_to :appointment, required: false
  belongs_to :patient, required: true
  belongs_to :treatment, required: true
  belongs_to :user, required: true


end
