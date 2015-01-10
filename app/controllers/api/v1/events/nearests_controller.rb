class Api::V1::Events::NearestsController < ApiController
  def index
    # really should use strong params
    @events = Event.near(
      [params[:lat], params[:lon]],
      params[:radius],
      units: :km
    )
  end
end
