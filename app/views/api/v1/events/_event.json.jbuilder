json.cache! event do
  json.address event.address
  json.created_at event.created_at
  json.ended_at event.ended_at
  json.id event.id
  json.lat event.lat
  json.lon event.lon
  json.name event.name
  json.started_at event.started_at
  json.updated_at event.updated_at

  json.owner do
    json.created_at event.owner.created_at
    json.device_token event.owner.device_token
    json.updated_at event.owner.updated_at
  end
end
