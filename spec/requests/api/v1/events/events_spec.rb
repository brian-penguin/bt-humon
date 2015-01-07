require 'faker'

describe 'GET /v1/events/:id' do
  it 'returns an event by :id' do
    event = create(:event)

    get "/v1/events/#{event.id}"

    expect(response_json).to eq(
      {
        'address' => event.address,
        'ended_at' => event.ended_at,
        'id' => event.id,
        'lat' => event.lat,
        'lon' => event.lon,
        'name' => event.name,
        'started_at' => event.started_at.as_json,
        'owner' => {
          'device_token' => event.owner.device_token
        }
      }
    )
  end
end

describe 'POST /v1/events' do
  it 'saves the address, lat, lon, name, and started_at date' do
    date = Time.current
    lat = Faker::Address.latitude.to_f.round(5)
    lon = Faker::Address.longitude.to_f.round(5)
    device_token = '123abc456xyz'
    owner = create(:user, device_token: device_token)

    post '/v1/events', {
      address: '123 Main St.',
      ended_at: date,
      lat: lat,
      lon: lon,
      name: 'Fun Happy Time!',
      started_at: date,
      owner: {
        device_token: device_token
      }
    }.to_json, { 'Content-Type' => 'application/json' }

    event = Event.last
    expect(response_json).to eq({ 'id' => event.id })
    expect(response_json).to eq '123 Main St.'
    expect(event.ended_at.to_i).to eq date.to_i
    expect(event.lat).to eq lat
    expect(event.lon).to eq lon
    expect(event.name).to eq 'Fun Happy Time!'
    expect(event.started_at.to_i).to eq date.to_i
    expect(event.owner).to eq owner
  end
end
