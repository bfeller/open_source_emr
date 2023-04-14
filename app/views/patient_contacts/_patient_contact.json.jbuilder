json.extract! patient_contact, :id, :name, :patient_id, :primary, :phone, :email, :address, :contact_method, :name, :notes, :created_at, :updated_at
json.url patient_contact_url(patient_contact, format: :json)
