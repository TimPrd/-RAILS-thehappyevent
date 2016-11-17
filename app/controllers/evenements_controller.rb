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
    @pwd        = params[:verifpass]
    @ebool      = false
    if !@eactual.isPrivate || @eactual.userId==current_user.id
      @ebool=true
    end


    @participant   = Participant.where(status: 'participe', evenementId: @eactual.id)
    @noparticipant = Participant.where(status: 'refus'    , evenementId: @eactual.id)
    @mbparticipant = Participant.where(status: '?'        , evenementId: @eactual.id)

    @tabtel = Array.new
    @tabmel = Array.new
    @participant.each do |p|
      @tabtel << User.find(p.userId).tel
      @tabmel << User.find(p.userId).email
    end




    @listtel=""
    @listmel=""
    @tabtel.each do |t|
      @listtel.concat(t.to_s + ",")
    end
    @listtel.concat("")

    @tabmel.each do |m|
      @listmel.concat(m.to_s + ",")
    end

  end




  def new
    @evenement = Evenement.new
    @title = "Nouvel evenement"


  end


  def create
    @evenement = Evenement.new
    @evenement.numero     = params[:evenement][:numero]
    @evenement.route      = params[:evenement][:route]
    @evenement.zipCode    = params[:evenement][:zipCode]
    @evenement.ville      = params[:evenement][:ville]
    @evenement.pays       = params[:evenement][:pays]
    @evenement.address    = " "+@evenement.numero.to_s + " " + @evenement.route.to_s + " - " + @evenement.ville.to_s + " " + @evenement.zipCode.to_s


    @elonlat = Geocoder.search(@evenement.address)
    @evenement.longitude  = @elonlat[0].longitude
    @evenement.latitude   = @elonlat[0].latitude
    @evenement.isPrivate  = params[:evenement][:isPrivate]
    @evenement.datee      = params[:evenement][:datee]
    @evenement.userId     = current_user.id


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
