module RestaurantsHelper

  def image_for(restaurant)
    if restaurant.image_file_name.blank?
      image_tag "http://placehold.it/75x75"
    else
      image_tag restaurant.image_file_name
    end #if
  end #image_for(restaurant)

  ###### Wanted to make a list on categories on the restaurant index and use truncate to limit the characters
  # def list_categories(restaurant)
  #   category_list = []
  #   restaurant.categories.each do |category|
  #     category_list << category.name
  #   end #each
  #   truncate(category_list.to_s, length: 45, separator: " ")
  # end #list_categories(restaurant)


end #RestaurantsHelper
