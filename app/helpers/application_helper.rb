module ApplicationHelper

 def page_title
   if content_for?(:title)
     "RQ - #{content_for(:title)}"
    else
     "RestaurantQueue"
   end #content_for
 end #page_title

private
  def untried_restaurants(restaurants)
    untried = []
    restaurants.each do |restaurant|
      unless restaurant.outings.size > 0
        untried << restaurant
      end #unless
    end #each
    untried
  end #untried_restaurants(restaurants)
  #helper_method :untried_restaurants

end #ApplicationHelper
