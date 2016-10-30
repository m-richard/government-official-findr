class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end

  def new
    @district = District.new
  end

  def show
    @district = District.find(params[:id])
    zip_code = @district.zip_code
    api_data = Net::HTTP.get_response(URI("http://whoismyrepresentative.com/getall_mems.php?zip=#{zip_code}&output=json"))
    result = JSON.parse(api_data.body)
    @district.rep_name = result['results'][0]['name']
    @district.rep_district = result['results'][0]['district']
    @district.rep_phone = result['results'][0]['phone']
    @district.rep_link = result['results'][0]['link']
    @district.rep_state = result['results'][0]['state']
    @district.sen1_name = result['results'][1]['name']
    @district.sen1_seat = result['results'][1]['district']
    @district.sen1_phone = result['results'][1]['phone']
    @district.sen1_link = result['results'][1]['link']
    @district.sen2_name = result['results'][2]['name']
    @district.sen2_seat = result['results'][2]['district']
    @district.sen2_phone = result['results'][2]['phone']
    @district.sen2_link = result['results'][2]['link']
  end

  def create
    zip_code = params[:district][:zip_code]
    @district = District.new(district_params)
    api_data = Net::HTTP.get_response(URI("http://whoismyrepresentative.com/getall_mems.php?zip=#{zip_code}&output=json"))
    result = JSON.parse(api_data.body)
    @district.rep = result['results'][0]
    @district.sen1 = result['results'][1]
    @district.sen2 = result['results'][2]
    if @district.save
      redirect_to district_path(@district)
    else
      flash[:notice] = @district.errors.full_messages.join(", ")
      render :create
    end
  end

  def destroy
    District.destroy(params[:id])
    redirect_to districts_path
  end

  private

  def district_params
    params.require(:district).permit(:zip_code)
  end
end
