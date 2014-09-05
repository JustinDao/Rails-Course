class SessionsController < ApplicationController

  def new
    if current_user?
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) 
    if user && user.authenticate(params[:session][:password]) 
      session[:remember_token] = user.id
      redirect_to user_path(user) # redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:remember_token] = nil
    redirect_to root_path
  end



end
