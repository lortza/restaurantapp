module UsersHelper
  def outings_count(restaurants)
    count = [] 
    restaurants.each do |restaurant| 
      count << restaurant.outings.size 
    end #each
    total = count.inject(:+) 
    total 
  end #outings_count(restaurants)

  def untried_restaurant_count(restaurants)
    untried_count = 0
    @user.restaurants.each do |restaurant|
      unless restaurant.outings.size > 0
        untried_count += 1
      end #if
    end #each
    untried_count 
  end #untried_restaurant_count(restaurants)
    
  def dishes_count(restaurants)
    count = [] 
    restaurants.each do |restaurant| 
      count << restaurant.dishes.size 
    end #each
    total = count.inject(:+) 
    total 
  end #dishes_count(restaurants)

end #UsersHelper
