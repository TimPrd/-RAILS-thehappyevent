class UserMailer < ApplicationMailer
  default from: 'timpardieu@yahoo.fr'

  def welcome_email(user)
    @user = user
    @url  = 'http://www.thehappyevent.com'
    mail(to: @user.email, subject: 'Bienvenue sur HappyEvent')
  end
end