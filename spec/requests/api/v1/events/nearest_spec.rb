describe 'Events Requests' do
  describe 'GET /v1/events/nearests?lat=&lon=&radius=' do
    it 'returns events closest to lat and lon' do
      near_event = create(:event, :worcester)
      farther_event = create(:event, :springfield)
      boston_event = attributes_for(:event, :boston)
      create(:event, :san_fran)
      # distance is measured in kilometers (Mass is about 306 km across)
      radius = 306

      get v1_events_nearests_path(lat: boston_event[:lat],
                                  lon: boston_event[:lon],
                                  radius: radius)

      expect(response).to have_http_status(:ok)
      expect(response).to match_response_schema(:nearests)
      expect(response_json.first['id']).to eq(near_event.id)
      expect(response_json.last['id']).to eq(farther_event.id)
    end
    it 'returns an error message if no event is found' do
      request_lat = 37.771098
      request_lon = -122.430782
      request_radius = 1

      get v1_events_nearests_path(lat: request_lat,
                                  lon: request_lon,
                                  radius: request_radius)

      expect(response).to have_http_status(:no_content)
    end
  end
end
