class MapsController < ApplicationController

  def create

    # example params
    # params[:location][:latitude] = "41.8762"
    # params[:location][:longitude] = "-87.6531"
    # params[:location][:keyword] = "food"

    if params[:location][:latitude] && params[:location][:longitude] && params[:location][:keyword]
      latitude = params[:location][:latitude]
      longitude = params[:location][:longitude]
      keyword = params[:location][:keyword]
    else
      return render json: { error: "bad json call"  }
    end


    map_response = JSON.parse(open("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&keyword=#{keyword}&radius=300&key=#{ENV["GOOGLE_MAPS"]}").read)

    location_info = []

    map_response["results"].each do |result|
      location_info << result["name"]
      location_info << result["geometry"]
    end

    render json: { keyword => location_info }
  end

  # def map_params
  #   params.require(:location).permit(:latitude, :longitude, :keyword)
  # end

end
