class PagesController < ApplicationController

    @events = Evenement.all
    location =   request.remote_ip
    @city = request.location.city
  
end
