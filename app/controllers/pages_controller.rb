class PagesController < ApplicationController
  def index
    @events = Evenement.all
    @e =   request.remote_ip

    @location = Geokit::Geocoders::IpGeocoder.geocode(@e)
    @city = location.city
  end
end
