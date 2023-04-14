json.extract! patient, :id, :full_name, :dob, :user_id, :gender, :health_card, :version_code, :archived_at, :notes, :created_at, :updated_at
json.url patient_url(patient, format: :json)
