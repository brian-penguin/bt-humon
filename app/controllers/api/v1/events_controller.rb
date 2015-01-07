class Api::V1::EventsController < ApiController
  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render
    end
  end

  private

  def event_params
    {
      address: params[:address],
      ended_at: params[:ended_at],
      lat: params[:lat],
      lon: params[:lon],
      name: params[:name],
      started_at: params[:started_at],
      owner: user
    }
  end

  def user
    User.find_or_create_by(device_token: device_token)
  end

  def device_token
    params[:owner].try(:[], :device_token)
  end
end
