class UsersController < ApplicationController

  before_action :authenticate, :only => [:edit, :update]
  before_action :correct_user, :only => [:edit, :update]

  def show
    @user = User.find(params[:id])
    @img_user = Gravatar.new(@user.email).image_url
  end

  def new
    @user = User.new
    @title = "S'inscrire"
  end

  def create
    @user = User.new
    @user.nom                   = params[:user][:nom]
    @user.email                 = params[:user][:email]
    @user.password              = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.tel                   = params[:user][:tel]

    if @user.save
      sign_in @user
      UserMailer.welcome_email(@user).deliver_now
      redirect_to @user
    else
      @titre = "Inscription"
      render 'new'
    end
  end


end
