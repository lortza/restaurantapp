class DishesController < ApplicationController

  before_action :set_restaurant

  def index
    @dishes = @restaurant.dishes 
  end #index
    
  def new
    @dish = @restaurant.dishes.new
  end #new

  def create
    @dish = @restaurant.dishes.new(dish_params)
    #@dish.user = current_user
    if @dish.save
      redirect_to @restaurant, notice: "Yum! Sounds good!"
    else
      render :new
    end #if
  end #create

private
  def dish_params
    params.require(:dish).permit(:name, :restaurant_id) 
  end #dish_params

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end #restaurant
    
end #DishesController
