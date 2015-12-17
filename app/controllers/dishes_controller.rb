class DishesController < ApplicationController

  before_action :set_restaurant
  #before_action :set_dish

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
      redirect_to @restaurant, notice: "Yum! A #{@dish.name} sounds good!"
    else
      render :new
    end #if
  end #create

  def show 
  end #show
    
  def destroy
    @dish = @restaurant.dishes.find(params[:id]) 
    @dish.destroy
    redirect_to @restaurant
  end #destroy
    

private
  def dish_params
    params.require(:dish).permit(:name, :restaurant_id) 
  end #dish_params

  def set_restaurant
    @restaurant = Restaurant.find_by!(slug: params[:restaurant_id])
  end #restaurant

  # def set_dish #this is questionable
  #   @dish = @restaurant.dishes.find(params[:id])
  # end #set_dish
    
end #DishesController
