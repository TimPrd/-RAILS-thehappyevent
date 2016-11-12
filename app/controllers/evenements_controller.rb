class EvenementsController < ApplicationController
  require 'securerandom'
  require 'date'
  def show_all_events
    @events = Evenement.all
    @efirst = Evenement.first
  end

  def show_my_events
    @events = Evenement.all
  end

  def show
    @eactual    = Evenement.find(params[:id])
    @createur   = User.find(@eactual.userId).nom
    @pwd        =params[:verifpass]
    @ebool      = false
    if !@eactual.isPrivate || @eactual.userId==current_user.id
      @ebool=true
    end


  end



  def new
    @evenement = Evenement.new
    @title = "Nouvel evenement"
    @place = Evenement.new
    @place.address = "3 rue Corneille Colombelles 14460"


  end

  def create
    @evenement = Evenement.new
    @evenement.numero     = 14
    @evenement.route      = params[:evenement][:route]
    @evenement.zipCode    = params[:evenement][:zipCode]
    @evenement.ville      = params[:evenement][:ville]
    @evenement.pays       = params[:evenement][:pays]
    @evenement.address    = " "+@evenement.numero.to_s + " " + @evenement.route.to_s + " - " + @evenement.ville.to_s + " " + @evenement.zipCode.to_s


    @elonlat = Geocoder.search(@evenement.address)
    @evenement.longitude  = @elonlat[0].longitude
    @evenement.latitude   =  @elonlat[0].latitude
    @evenement.isPrivate  = params[:evenement][:isPrivate]
    @evenement.datee      = params[:evenement][:datee]
    @evenement.userId     = current_user.id

    @evenement.participants = [4,5,6]

    if @evenement.isPrivate
      @evenement.pwd = SecureRandom.hex(8)


    end
    if @evenement.save
      puts "Reussite"
      if @evenement.isPrivate
        EventMailer.pwdevent_email(@evenement,current_user).deliver_now
      end
      redirect_to @evenement
    end
  end

end
