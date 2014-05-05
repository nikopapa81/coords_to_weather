require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather

 @address = params[:address]
        if @address != nil
    @url_safe_address = URI.encode(@address)
    else
    @url_safe_address = URI.encode("foster and sheridan")
    end

       url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]


    your_api_key = "25cc78001f3173f7326b8d0688a63139"

    url = "https://api.forecast.io/forecast/#{your_api_key}/#{@latitude},#{@longitude}"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]
  end
end
