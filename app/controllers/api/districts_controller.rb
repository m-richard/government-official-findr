class Api::DistrictsController < ApiController
  def show
    @district = District.find(params[:district_id])
    render json: { districts: districts }, status: :ok
  end
end
