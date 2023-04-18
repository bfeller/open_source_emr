class Treatment < ApplicationRecord


  belongs_to :diagnosis, required: true
  belongs_to :patient, required: true
  belongs_to :user, required: true
  belongs_to :appointment, required: true
  has_many :notes, dependent: :destroy
  has_many :prescriptions, dependent: :destroy


end
