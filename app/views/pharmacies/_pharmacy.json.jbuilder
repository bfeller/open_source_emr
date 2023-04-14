json.extract! pharmacy, :id, :name, :address, :phone, :email, :notes, :created_at, :updated_at
json.url pharmacy_url(pharmacy, format: :json)
json.notes pharmacy.notes.to_s
