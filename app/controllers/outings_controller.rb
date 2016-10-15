class OutingsController < ApplicationController

  before_action :set_restaurant, :set_outing

  def index
    @outings = @restaurant.outings
  end #index

  def new
    @outing = @restaurant.outings.new
  end #new

  def create
    @outing = @restaurant.outings.new(outing_params)
    #@outing.user = current_user
    if @outing.save
      redirect_to @restaurant, notice: "High Five! Your trip to #{@restaurant.name} has been recorded!"
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
      if @outing.update(outing_params)
        format.html { redirect_to restaurant_path(params[:restaurant_id]), notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @outing }
      else
        format.html { render :edit }
        format.json { render json: @outing.errors, status: :unprocessable_entity }
      end#if
    end#respond
  end#update

  def destroy
    @outing = @restaurant.outings.find(params[:id])
    @outing.destroy
    redirect_to @restaurant
  end #destroy


private

  def set_restaurant
    @restaurant = Restaurant.find_by!(slug: params[:restaurant_id])
  end #restaurant

  def set_outing
    @outing = Outing.find(params[:id])
  end #set_outing

  def outing_params
    params.require(:outing).permit(:date, :note, :restaurant_id)
  end #outing_params
end #OutingsController
