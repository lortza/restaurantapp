module RestaurantsHelper

  def image_for(restaurant)
    if restaurant.image_file_name.blank?
      image_tag "http://placehold.it/75x75"
    else
      image_tag restaurant.image_file_name
    end #if
  end #image_for(restaurant)

  def restaurant_filter_title
    case params[:filter]
    when "fave" then "Favorite Restaurants"
    when "archived" then "Archived Restaurants"
    when "not_tried" then "Restaurants To Try"
    else "My Restaurants"
    end #case
  end #page_title

  def show_all_button
    unless restaurant_filter_title == "My Restaurants"
      link_to 'Show All', restaurants_path, class: "btn btn-xs btn-default"
    end #unless
  end #show_all_button

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
    


  ###### Wanted to make a list on categories on the restaurant index and use truncate to limit the characters
  # def list_categories(restaurant)
  #   category_list = []
  #   restaurant.categories.each do |category|
  #     category_list << category.name
  #   end #each
  #   truncate(category_list.to_s, length: 45, separator: " ")
  # end #list_categories(restaurant)


end #RestaurantsHelper
