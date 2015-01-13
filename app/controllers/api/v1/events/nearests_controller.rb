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
      render status: :no_content
    end
  end

  private

  def coordinates
    [params[:lat], params[:lon]]
  end
end
