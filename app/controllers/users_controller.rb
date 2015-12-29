class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @restaurants = @user.restaurants
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      session[:user_id] = @user.id #signs in the user upon create
      redirect_to @user, notice: "Welcome #{@user.name}! Thanks for signing up!"
    else
      render :new
    end #if
  end #create

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "#{@user.name}'s account has been successfully updated."
     else
       render :edit
     end #if
  end #update

  # DELETE /users/1
  def destroy
    @user.destroy
    session[:user_id] = nil
    if current_user_admin?
      redirect_to users_url, alert: "#{@user.name}'s Account successfully deleted!"
    else
      redirect_to signin_url, alert: "#{@user.name}'s Account successfully deleted!"
    end #if
  end #destroy

  private
    def set_user
      @user = User.find_by!(username: params[:id])
    end #set_user

    def user_params
      params.require(:user).permit(:name, :email, :username, :password, :password_confirmation)
    end #user_params

    def require_correct_user
      @user = User.find_by!(username: params[:id])
        redirect_to root_url unless current_user?(@user)
    end #require_correct_user

    
end #UsersController
