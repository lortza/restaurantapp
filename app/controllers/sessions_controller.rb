class SessionsController < ApplicationController

  def new
    if current_user.present?
      redirect_to restaurants_url, notice: "You're already signed in! Here's your list of restaurants."
    else
      render :new
    end #if
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       flash[:notice] = "Welcome back, #{user.name}!"
       redirect_to root_url
    else
      flash.now[:alert] = "Invalid email/password combination"
      render :new
    end #if
  end #create

  def destroy
    session[:user_id] = nil
    redirect_to signin_url, notice: "You're now signed out!"
  end #destroy
end #SessionsController
