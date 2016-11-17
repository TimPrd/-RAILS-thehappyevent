class ParticipantsController < ApplicationController

  def show

  end

  def new
    @participant = Participant.new
    @title = "S'inscrire"

  end

  def create
    @participant = Participant.new
    @participant.evenementId   = params[:evenementId]
    @participant.userId        = current_user.id
    @participant.status        = params[:status]

    @participant.save

  end
end