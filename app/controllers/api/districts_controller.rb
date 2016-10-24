class Api::DistrictsController < ApplicationController
  include HTTParty
  base_uri 'https://www.googleapis.com/civicinfo/v1/representatives?address={@address}&includeOffices=true&levels=subLocality2&levels=subLocality1&levels=locality&levels=regional&roles=schoolBoard&roles=legislatorUpperBody&roles=legislatorLowerBody&roles=judge&fields=offices%2Cofficials&key={CIVIC_API_KEY}'

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
