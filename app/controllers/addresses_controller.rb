class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
    # @district = District.find(params[:district_id])
  end

  def create
    @address = Address.new(address_params)
    @district = District.find(params[:district_id])
    @address.district = @district

    if @address.save
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
