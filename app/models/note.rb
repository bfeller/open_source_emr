class Note < ApplicationRecord


  belongs_to :appointment, required: true
  belongs_to :treatment, required: false
  belongs_to :user, required: true

  has_rich_text :body

end
