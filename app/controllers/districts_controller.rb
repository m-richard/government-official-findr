class DistrictsController < ApplicationController
  include HTTParty
  base_uri 'https://www.googleapis.com/civicinfo/v2/representatives/CIVIC_API_KEY'

  def index
    @districts = District.all
  end

  def new
    @district = District.new
  end

  def show
    @district = District.find(params[:id])
    @addresses = @district.addresses
  end

  def create
    @address = Address.new(address_params)

    if @address.save
      render json: { district: @district }
    else
      render json: { errors: "Did not work" }, status: :bad_request
    end
  end
  # def create
  #   @district = District.new(district_params)
  #   if @district.save
  #     flash[:notice] = "District added successfully"
  #     redirect_to district_path(@district)
  #   else
  #     flash[:notice] = @district.errors.full_messages.join(", ")
  #     render :new
  #   end
  # end

  private

  def district_params
    params.require(:district).permit(:name, :representative)
  end
end
