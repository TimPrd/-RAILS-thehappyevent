class UserMailer < ApplicationMailer
  default from: 'timpardieu@yahoo.fr'

  def welcome_email(user)
    @user = user
    @url  = 'https://thehappyevent.herokuapp.com/signin'
    mail(to: @user.email, subject: 'Bienvenue sur HappyEvent !')
  end
end