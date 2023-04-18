json.array! @appointments do |a|
  json.start a.start_time
  json.end a.end_time
  json.resource a.user_id
  json.id a.id
  json.text a.patient.full_name
end