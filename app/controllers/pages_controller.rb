class PagesController < ApplicationController
  def myCity
    @events = Evenement.all
    location =   request.remote_ip
    @latV = request.location.latitude
    @logV = request.location.longitude

  end

  def index

  end
end
