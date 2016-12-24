class PagesController < ApplicationController
  def myCity
    @events = Evenement.all
    location =   request.remote_ip
    @city = request.location.latitude
  end
end
