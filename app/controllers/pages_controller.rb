class PagesController < ApplicationController
  def index
    @events = Evenement.all
    @e =   request.remote_ip
  end
end
