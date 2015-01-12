describe 'Events Requests' do
  describe 'GET /v1/events/:id' do
    it 'returns an event by :id' do
      event = create(:event)

      get "/v1/events/#{event.id}"

      expect(response).to match_response_schema(:event)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /v1/events' do
    it 'saves the address, lat, lon, name, and started_at date', focus: true do
      event = build :event
      event_params = {
        address: event.address,
        ended_at: event.ended_at,
        lat: event.lat,
        lon: event.lon,
        name: event.name,
        started_at: event.started_at,
        owner: {
          device_token: event.owner.device_token
        }
      }

      post '/v1/events', { event: event_params }.to_json, 'Content-Type' =>
      'application/json'

      response_event = Event.last
      expect(response).to have_http_status(:created)
      expect(response).to match_response_schema(:event)
      expect(response_json['id']).to eq(response_event.id)
    end

    it 'returns an error message when invalid' do
      bad_event_params = {
        address: nil,
        ended_at: nil,
        lat: nil,
        lon: nil,
        name: nil,
        started_at: nil,
        owner: {
          device_token: nil
        }
      }
      post '/v1/events',
           { event: bad_event_params }.to_json,
           'Content-Type' => 'application/json'

      expect(response_json).to eq(
        'message' => 'Validation Failed',
        'errors' => [
          "Lat can't be blank",
          "Lon can't be blank",
          "Name can't be blank",
          "Started at can't be blank"
        ]
      )
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PATCH /v1/events/:id' do
    it 'updates the events attributes' do
      event = create(:event, name: 'Old Name')
      new_name = 'New Name'
      event_params = {
        name: new_name,
        owner: {
          device_token: event.owner.device_token
        }
      }

      patch "/v1/events/#{event.id}",
            { event: event_params }.to_json,
            'Content-Type' => 'application/json'

      expect(response).to have_http_status(:ok)
      expect(response_json).to eq(
        'address' => event.address,
        'created_at' => event.created_at.as_json,
        'ended_at' => event.ended_at,
        'id' => event.id,
        'lat' => event.lat,
        'lon' => event.lon,
        'name' => new_name,
        'started_at' => event.started_at.as_json,
        'updated_at' => event.updated_at.as_json,
        'owner' => {
          'created_at' => event.owner.created_at.as_json,
          'device_token' => event.owner.device_token,
          'updated_at' => event.owner.updated_at.as_json
        }
      )
    end

    it 'returns and error message when invalid' do
      event = create(:event)
      bad_event_params = attributes_for(:event, name: nil)

      patch "/v1/events/#{event.id}",
            { event: bad_event_params }.to_json,
            'Content-Type' => 'application/json'

      event.reload
      expect(event.name).to_not be nil
      expect(response_json).to eq(
        'message' => 'Validation Failed',
        'errors' => [
          "Name can't be blank",
        ]
      )
    end
  end
end
