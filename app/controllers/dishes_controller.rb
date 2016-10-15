class DishesController < ApplicationController

  before_action :set_restaurant
  before_action :set_dish

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

  def edit
  end #edit

  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to restaurant_path(params[:restaurant_id]), notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end#if
    end#respond
  end#update

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

  def set_dish
    @dish = @restaurant.dishes.find(params[:id])
  end #set_dish

end #DishesController
