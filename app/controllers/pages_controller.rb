class PagesController < ApplicationController
  def index
    @events = Evenement.all
    location =   request.remote_ip
    @city = request.location.city
  end
end
