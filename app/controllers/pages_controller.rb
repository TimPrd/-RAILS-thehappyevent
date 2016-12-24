class PagesController < ApplicationController
  def index
    @events = Evenement.all
    @latV = request.location.latitude
    @logV = request.location.longitude



    location =   request.remote_ip
    @city = request.location.city
  end
end
