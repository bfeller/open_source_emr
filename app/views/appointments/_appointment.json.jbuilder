json.extract! appointment, :id, :patient_id, :user_id, :start_time, :end_time, :reception_notes, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
