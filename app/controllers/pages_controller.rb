class PagesController < ApplicationController
  def index
    @events = Evenement.all
    @e =   request.remote_ip
    @city = @e.city
  end
end
