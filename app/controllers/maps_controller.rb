class MapsController < ApplicationController

  def index


    # example params
    # params[:location][:latitude] = "41.8762"
    # params[:location][:longitude] = "-87.6531"
    # params[:location][:keywords] = "pizza,food"

    if params[:location][:latitude] && params[:location][:longitude]
      latitude = params[:location][:latitude]
      longitude = params[:location][:longitude]
      items = Item.all
      # keywords = params[:location][:keywords].split(",")
    else
      return render json: { error: "bad request"  }
    end


    locations = []

    items.each do |item|
      json_parse = JSON.parse(open("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&keyword=#{item.keyword}&radius=500&key=#{ENV["GOOGLE_MAPS"]}").read)

      json_parse["item"] = item.name
      locations << json_parse
    end
    location_info = []


    locations.each do |result|
      if result["status"] == "OK"
        result["results"].each do |details|
          has_key = false
          detail_hash = { details["name"] => {  address: details["vicinity"], items: [result["item"]], location: details["geometry"]["location"] } }

          location_info.each do |hash|
            if hash.has_key?(details["name"])
              has_key = true
              hash[details["name"]][:items] << result["item"]
            end
          end

          if has_key == false
            location_info << detail_hash
          end
        end
      end

    end

    render json: { "locations": location_info }
  end

end
