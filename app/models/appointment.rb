class Appointment < ApplicationRecord


  belongs_to :patient, required: true
  belongs_to :user, required: true


end
