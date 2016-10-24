class Api::DistrictsController < ApplicationController
  include HTTParty
  base_uri 'https://www.googleapis.com/civicinfo/v2/representatives/CIVIC_API_KEY'

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
end
