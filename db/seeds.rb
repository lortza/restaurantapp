User.create!(
  name: "Carl",
  username: "carl",
  email: "carl@email.com",
  password: "password",
  admin: false
  )

Restaurant.create!([
  {
    user_id: 3,
    name: "Cat's Paradise",
    street: "123 Main Street",
    city: "Atlanta",
    state: "GA", 
    zip: "73653",
    phone: "505-555-5555",
    website: "http://www.website.com",
    price: "$$",
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
    user_id: 3,
    name: "ChezChaz",
    street: "123 South Broad Street",
    city: "Beaverton",
    state: "AL", 
    zip: "73653",
    phone: "505-555-5555",
    website: "http://www.website.com",
    price: "$$",
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
    user_id: 3,
    name: "Coconut Cafe",
    street: "123 North Broadway Street",
    city: "Calcutta",
    state: "CA", 
    zip: "73653",
    phone: "505-555-5555",
    website: "http://www.website.com",
    price: "$",
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
