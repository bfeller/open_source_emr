json.extract! prescription, :id, :appointment_id, :patient_id, :notes, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
