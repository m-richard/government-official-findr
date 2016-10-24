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
    if @district.save
      flash[:notice] = "District added successfully"
      redirect_to district_path(@district)
    else
      flash[:notice] = @district.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def district_params
    params.require(:district).permit(:name, :representative)
  end
end
