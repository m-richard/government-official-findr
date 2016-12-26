class StatesController < ApplicationController
  def index
    @states = State.all
  end

  def new
    @state = State.new
  end

  def show
    @state = State.find(params[:id])
    zip_code = @state.zip_code
    api_data = Net::HTTP.get_response(URI("http://whoismyrepresentative.com/getall_mems.php?zip=#{zip_code}&output=json"))
    result = JSON.parse(api_data.body)
    @state.rep_name = result['results'][0]['name']
    @state.rep_state = result['results'][0]['district']
    @state.rep_phone = result['results'][0]['phone']
    @state.rep_link = result['results'][0]['link']
    @state.rep_state = result['results'][0]['state']
    @state.sen1_name = result['results'][1]['name']
    @state.sen1_seat = result['results'][1]['district']
    @state.sen1_phone = result['results'][1]['phone']
    @state.sen1_link = result['results'][1]['link']
    @state.sen2_name = result['results'][2]['name']
    @state.sen2_seat = result['results'][2]['district']
    @state.sen2_phone = result['results'][2]['phone']
    @state.sen2_link = result['results'][2]['link']
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
