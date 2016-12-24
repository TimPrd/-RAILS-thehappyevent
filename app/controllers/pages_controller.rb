class PagesController < ApplicationController
  def index
    @events = Evenement.all
    location =   request.remote_ip
    @latV = request.location.latitude
    @logV = request.location.city

  end
end
