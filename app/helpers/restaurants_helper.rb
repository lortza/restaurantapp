module RestaurantsHelper

  def image_for(restaurant)
    if restaurant.image_file_name.blank?
      image_tag "http://placehold.it/75x75"
    else
      image_tag restaurant.image_file_name
    end #if
  end #image_for(restaurant)
end #RestaurantsHelper
