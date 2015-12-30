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

  def nav_link_to(text, url)
    classes = ['button']
    classes << 'active' if current_page?(url)
    link_to(text, url, class: classes.join(' '))
  end #nav_link_to

end #ApplicationHelper
