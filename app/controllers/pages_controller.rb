class PagesController < ApplicationController
  def index
    @events = Evenement.all
    location =   request.location
    @latV = request.location.latitude
    @logV = request.location.longitude

  end
end
