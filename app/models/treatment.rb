class Treatment < ApplicationRecord


  belongs_to :diagnosis, required: true
  belongs_to :client, required: true
  belongs_to :user, required: true
  belongs_to :appointment, required: true


end
