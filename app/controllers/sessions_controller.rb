class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.name}!"
      redirect_to(session[:intended_url] || user) #sends user to the url where they were pre sign in OR ro the user page
      session[:intended_url] = nil #clears the intended_url for the session
    else
      flash.now[:alert] = "Invalid email/password combination"
      render :new
    end
  end #create

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You're now signed out!"
  end #destroy
end #SessionsController
