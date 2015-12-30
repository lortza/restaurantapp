class RestaurantsController < ApplicationController
  #before_action :require_correct_user
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :correct_user_restaurant, only: [:show]


  # GET /restaurants
  # GET /restaurants.json
  def index
    case params[:filter]
    when "fave" then @restaurants = current_user.restaurants.fave
    when "archived" then @restaurants = current_user.restaurants.archived
    when "not_tried" then @restaurants = current_user.restaurants.not_tried
    when "been_a_while"
      @restaurants = current_user.restaurants.been_a_while
    else @restaurants = current_user.restaurants.active
    end #case
  end #index

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @categories = @restaurant.categories
    @outings = @restaurant.outings
    @dishes = @restaurant.dishes
  end #show

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurants_url, notice: "Restaurant successfully created!"
    else
      render :new
    end #if
  end #create

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant successfully updated!"
    else
      render :edit
    end #if
  end #update

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, alert: 'Restaurant was successfully deleted.' 
  end #destroy

  private
    def set_restaurant
      @restaurant = Restaurant.find_by!(slug: params[:id])
    end #set_restaurant

    def correct_user_restaurant
      unless current_user.restaurants.include? @restaurant
        redirect_to restaurants_url, notice: "Whoops! That wasn't your restaurant."
      end #if 
    end #correct_user_restaurant
      

    def restaurant_params
      params.require(:restaurant).permit(:name, :street, :city, :state, :zip, :phone, :website, :image_file_name, :price, :fave, :archive, :user_id, :slug, :notes, category_ids: [])
    end #restaurant_params

end #RestaurantsController
