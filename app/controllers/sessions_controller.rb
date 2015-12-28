class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to restaurants_url
    else
      flash.now[:alert] = "Invalid email/password combination"
      render :new
    end
  end #create

  def destroy
    session[:user_id] = nil
    redirect_to signin_url, notice: "You're now signed out!"
  end #destroy
end #SessionsController
