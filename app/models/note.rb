class Note < ApplicationRecord


  belongs_to :appointment, required: true
  belongs_to :treatment, required: true
  belongs_to :user, required: true


end
