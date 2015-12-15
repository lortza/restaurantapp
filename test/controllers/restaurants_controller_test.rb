require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { archive: @restaurant.archive, city: @restaurant.city, fave: @restaurant.fave, image_file_name: @restaurant.image_file_name, name: @restaurant.name, phone: @restaurant.phone, price: @restaurant.price, state: @restaurant.state, street: @restaurant.street, website: @restaurant.website, zip: @restaurant.zip }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant, restaurant: { archive: @restaurant.archive, city: @restaurant.city, fave: @restaurant.fave, image_file_name: @restaurant.image_file_name, name: @restaurant.name, phone: @restaurant.phone, price: @restaurant.price, state: @restaurant.state, street: @restaurant.street, website: @restaurant.website, zip: @restaurant.zip }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
