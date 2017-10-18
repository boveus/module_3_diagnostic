class SearchController < ApplicationController
  def index
    response = HTTParty.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?zip=#{zip_code_params["q"]}&limit=10&distance=6&fuel_type=ELEC,LPG&api_key=#{ENV["nrel_key"]}")
    json = JSON.parse(response.body)
    binding.pry
  end

  private def zip_code_params
    params.permit(:q)
  end
end
