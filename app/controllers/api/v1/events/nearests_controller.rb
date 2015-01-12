class Api::V1::Events::NearestsController < ApiController
  def index
    @events = Event.near(
      coordinates,
      params[:radius],
      units: :km
    )
    if @events.present?
      render status: :ok
    else
      render json: { message: 'No Events Found' }, status: :ok
    end
  end

  private

  def coordinates
    [params[:lat], params[:lon]]
  end
end
