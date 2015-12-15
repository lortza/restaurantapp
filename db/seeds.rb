# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create!(name: "Thai")
Category.create!(name: "Vegetarian")
Category.create!(name: "Vegan")
Category.create!(name: "Indian")
Category.create!(name: "Pizza")
Category.create!(name: "Food Truck")
Category.create!(name: "Hipster")
Category.create!(name: "Pho")
Category.create!(name: "Vietnamese")
Category.create!(name: "Mexican")
Category.create!(name: "Colombian")
Category.create!(name: "Ethiopian")
Category.create!(name: "American")
Category.create!(name: "Tapas")
Category.create!(name: "Wine Bar")
Category.create!(name: "Brewery")
Category.create!(name: "Coffee Shop")
Category.create!(name: "Bakery")

User.create!(
  name: "Allie",
  email: "allie@email.com",
  password: "password"
  )

Restaurant.create!([
  {
    user_id: 1,
    name: "Abe's Kitchen",
    street: "123 Main Street",
    city: "Atlanta",
    state: "GA", 
    zip: "73653",
    phone: "505-555-5555",
    website: "http://www.website.com",
    price: "Average",
    image_file_name: "http://resizer.otstatic.com/v1/fDzI465IL8%2B687zSupRS4Q/23684405.jpg",
    fave: false,
    archive: false
  }])
Categorization.create!(
  restaurant_id: 1,
  category_id: 1
  )
Categorization.create!(
  restaurant_id: 1,
  category_id: 2
  )
Categorization.create!(
  restaurant_id: 1,
  category_id: 3
  )
Dish.create!(
  name: "Veal Picatta",
  restaurant_id: 1
  )
Dish.create!(
  name: "Veggie Po'Boy",
  restaurant_id: 1
  )
Outing.create!(
  date: "2015-02-09",
  note: "Went after the Botanic Gardens",
  restaurant_id: 1
  )
Outing.create!(
  date: "2012-03-10",
  restaurant_id: 1
  )

Restaurant.create!([
  {
    user_id: 1,
    name: "Bea's Table",
    street: "123 South Broad Street",
    city: "Beaverton",
    state: "AL", 
    zip: "73653",
    phone: "505-555-5555",
    website: "http://www.website.com",
    price: "Average",
    image_file_name: "http://torontolife.com/wp-content/uploads/2014/11/wilbur-mexicana-toronto-restaurants-13-200x200.jpg",
    fave: false,
    archive: false
  }])
Categorization.create!(
  restaurant_id: 2,
  category_id: 4
  )
Categorization.create!(
  restaurant_id: 2,
  category_id: 5
  )
Categorization.create!(
  restaurant_id: 2,
  category_id: 6
  )
Dish.create!(
  name: "Pasta Primavera",
  restaurant_id: 2
  )
Dish.create!(
  name: "Halushki",
  restaurant_id: 2
  )
Outing.create!(
  date: "2013-02-09",
  note: "Stopped in before a hike",
  restaurant_id: 2
  )
Outing.create!(
  date: "2014-03-10",
  restaurant_id: 2
  )

Restaurant.create!([
  {
    user_id: 1,
    name: "Cora's Cafe",
    street: "123 North Broadway Street",
    city: "Calcutta",
    state: "CA", 
    zip: "73653",
    phone: "505-555-5555",
    website: "http://www.website.com",
    price: "Low",
    image_file_name: "https://c.zmtcdn.com/data/pictures/5/17874525/67a0a3f714f13184e39664903123ecd1_200_thumb.png",
    fave: true,
    archive: false
  }])
Categorization.create!(
  restaurant_id: 3,
  category_id: 4
  )
Categorization.create!(
  restaurant_id: 3,
  category_id: 5
  )
Categorization.create!(
  restaurant_id: 3,
  category_id: 6
  )
Dish.create!(
  name: "Lentil Pie",
  restaurant_id: 3
  )
Dish.create!(
  name: "Gaspacho",
  restaurant_id: 3
  )
Outing.create!(
  date: "2015-06-06",
  note: "Stopped in before a hike",
  restaurant_id: 3
  )
Outing.create!(
  date: "2014-04-11",
  restaurant_id: 3
  )
