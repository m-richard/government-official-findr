class DistrictsController < ApplicationController
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
    @district = District.new(district_params)
    zip_code = @district.zip_code
    api_data = Net::HTTP.get_response(URI("http://whoismyrepresentative.com/getall_mems.php?zip=#{zip_code}&output=json"))
    result = JSON.parse(api_data.body)
    @district.rep = result['results'][0]
    @district.sen1 = result['results'][1]
    @district.sen2 = result['results'][2]
    if @district.save
      redirect_to districts_path(@district)
    else
      flash[:notice] = @district.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    District.destroy(params[:id])
    redirect_to new_district_path
  end

  private

  def district_params
    params.require(:district).permit(:zip_code)
  end
end
