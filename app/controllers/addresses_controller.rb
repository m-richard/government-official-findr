class AddressesController < ApplicationController
  include HTTParty
  base_uri 'https://www.googleapis.com/civicinfo/v1/representatives?address={@address}&includeOffices=true&levels=subLocality2&levels=subLocality1&levels=locality&levels=regional&roles=schoolBoard&roles=legislatorUpperBody&roles=legislatorLowerBody&roles=judge&fields=offices%2Cofficials&key={CIVIC_API_KEY}'

  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
    # @district = District.find(params[:district_id])
  end

  def create
    @address = Address.new(address_params)

    if @address.valid?
      @district.create
      @district = District.find(params[:district_id])
      @address.district = @district
      flash[:notice] = "Address added successfully"
      redirect_to districts_path(@district)
    else
      flash[:notice] = @address.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip_code)
  end
end


  def address
    @address = Address.new
  end

  def create
  @address = Address.new(address_params)

  if @address.save
    render json: { district: @district }
  else
    render json: { errors: "Did not work" }, status: :bad_request
  end
  end
