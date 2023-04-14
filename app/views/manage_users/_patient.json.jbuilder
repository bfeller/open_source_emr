json.extract! user, :id, :email, :full_name, :created_at, :updated_at
json.url patient_url(user, format: :json)
