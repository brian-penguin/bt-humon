describe 'Events Requests' do
  describe 'GET /v1/events/nearests?lat=&lon=&radius=' do
    it 'returns events closest to lat and lon' do
      near_event = create(:event,
                          lat: 37.760322,
                          lon: -122.429667)
      farther_event = create(:event,
                             lat: 37.760321,
                             lon: -122.429667)
      create(:event, lat: 37.687737, lon: -122.470608)
      request_lat = 37.771098
      request_lon = -122.430782
      request_radius = 5

      get "/v1/events/nearests?
                        lat=#{request_lat}&
                        lon=#{request_lon}&
                        radius=#{request_radius}"

binding.pry
      expect(response).to have_http_status(:ok)
      expect(response_json).to eq([
        'address' => near_event.address,
        'created_at' => near_event.created_at.as_json,
        'ended_at' => near_event.ended_at,
        'id' => near_event.id,
        'lat' => near_event.lat,
        'lon' => near_event.lon,
        'name' => near_event.name,
        'started_at' => near_event.started_at.as_json,
        'updated_at' => near_event.updated_at.as_json,
        'owner' => {
          'created_at' => near_event.owner.created_at.as_json,
          'device_token' => near_event.owner.device_token,
          'updated_at' => near_event.owner.updated_at.as_json
        },
        'address' => farther_event.address,
        'created_at' => farther_event.created_at.as_json,
        'ended_at' => farther_event.ended_at,
        'id' => farther_event.id,
        'lat' => farther_event.lat,
        'lon' => farther_event.lon,
        'name' => farther_event.name,
        'started_at' => farther_event.started_at.as_json,
        'updated_at' => farther_event.updated_at.as_json,
        'owner' => {
          'created_at' => farther_event.owner.created_at.as_json,
          'device_token' => farther_event.owner.device_token,
          'updated_at' => farther_event.owner.updated_at.as_json
        }
      ])
    end
  end
end
