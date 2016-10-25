class AddressesController < ApplicationController
  require 'net/http'
  def index
    @addresses = Address.all
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    zip_code = params["zip_code"]
    api_data = Net::HTTP.get_response(URI("http://whoismyrepresentative.com/getall_mems.php?zip=#{zip_code}&output=json"))
    @district = api_data[results[district]]
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
