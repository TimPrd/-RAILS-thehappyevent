class EventMailer < ApplicationMailer
  default from: 'timpardieu@yahoo.fr'

  def pwdevent_email(event,user)
    @event = event
    @user  = user
    @url  = 'thehappyevent.com'
    mail(to: @user.email, subject: 'Clef de votre événement privé')
  end
end