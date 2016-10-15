module RestaurantsHelper

  def image_for(restaurant)
    if restaurant.image_file_name.blank?
      image_tag "restaurant_placeholder.jpg"
    else
      image_tag restaurant.image_file_name
    end #if
  end #image_for(restaurant)

  def restaurant_filter_title
    case params[:filter]
    when "fave" then "Favorite Restaurants"
    when "archived" then "Archived Restaurants"
    when "been_a_while" then "6 Months Since Last Visit"
    when "not_tried" then "Restaurants To Try"
    else "My Restaurants"
    end #case
  end #restaurant_filter_title

  def untried?(restaurant)
     restaurant.outings.size == 0
  end  #untried?

  def corner_banner(restaurant)
    if restaurant.archive?
       image_tag "corner_archived.png"
     elsif restaurant.fave?
       image_tag "corner_fave.png"
     elsif untried?(restaurant)
       image_tag "corner_new.png"
     else
     end #if
  end #corner_banner

  # Created for Restaurants Index to back out of a scoped filter
  # def show_all_button
  #   unless restaurant_filter_title == "My Restaurants"
  #     link_to 'Show All', restaurants_path, class: "btn btn-xs btn-default"
  #   end #unless
  # end #show_all_button

end #RestaurantsHelper
