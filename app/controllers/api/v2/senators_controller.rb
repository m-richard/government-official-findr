class Api::DistrictsController < ApiController
  def create
    @district = District.find(params[:district_id])
    render json: { districts: districts }, status: :ok
  end
end


# https://www.googleapis.com/civicinfo/v2/representatives?address=53+Bothfeld+Rd%2C+Newton%2C+MA+02459&includeOffices=true&levels=subLocality1&levels=subLocality2&levels=special&levels=regional&levels=locality&roles=legislatorUpperBody&roles=legislatorLowerBody&fields=normalizedInput%2Coffices%2Cofficials&key={YOUR_API_KEY}
