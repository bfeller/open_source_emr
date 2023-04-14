json.extract! note, :id, :appointment_id, :treatment_id, :user_id, :body, :created_at, :updated_at
json.url note_url(note, format: :json)
json.body note.body.to_s
