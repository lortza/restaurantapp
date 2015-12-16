class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
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
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      session[:user_id] = @user.id #signs in the user upon create
      redirect_to @user, notice: "Welcome #{@user.name}! Thanks for signing up!"
    else
      render :new
    end 
  end #create

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to @user, notice: "#{@user.name}'s account has been successfully updated."
     else
       render :edit
     end 
  end #update

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    #session[:user_id] = nil
    redirect_to users_url, alert: "#{@user.name}'s Account successfully deleted!"
  end #destroy

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def require_correct_user
      @user = User.find(params[:id])
        redirect_to root_url unless current_user?(@user)
    end #require_correct_user

    
end #UsersController
