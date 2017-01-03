class PagesController < ApplicationController
  def myCity
    @events = Evenement.all
    location =   request.remote_ip
    @latV = request.location.latitude
    @logV = request.location.longitude

  end

  def index
    @events = Evenement.all
    if params[:search]
      @events = Evenement.search(params[:search]).order("created_at DESC")
    else
      @events = Evenement.all.order('created_at DESC')
    end
  end
end

