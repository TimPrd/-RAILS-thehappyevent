class PagesController < ApplicationController
  def myCity
    @events = Evenement.all
    location =   request.remote_ip
    @latV = request.location.latitude
    @logV = request.location.longitude

  end

  def index
    @evenements = Evenement.all
    if params[:search]
      @events = Evenement.search(params[:search]).order("created_at DESC")
    else
      @events = ""
    end

  end
end

