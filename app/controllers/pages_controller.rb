class PagesController < ApplicationController
  def index
    @events = Evenement.all
    @efirst = Evenement.first
  end

end
