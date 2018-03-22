require 'test_helper'

class Api::V1::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = Factory.create(:restaurant, address: Factory.create(:address))
    password = "testingapi"
    user = Factory.create(:user, password: password, password_confirmation: password)
    @auth_token = auth_in(user, password)
  end

  test "should get index" do
    api_get v1_restaurants_url
    assert_response :success
  end

  test "should get new" do
    api_get new_v1_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      api_post v1_restaurants_url, params: { restaurant: { food_type: @restaurant.food_type, name: @restaurant.name } }
    end

    assert_response :created
  end

  test "should show restaurant" do
    api_get v1_restaurant_url(@restaurant.uuid)
    assert_response :success
  end

  test "should get edit" do
    api_get edit_v1_restaurant_url(@restaurant.uuid)
    assert_response :success
  end

  test "should update restaurant" do
    api_patch v1_restaurant_url(@restaurant.uuid), params: { restaurant: { food_type: @restaurant.food_type, name: @restaurant.name } }
    assert_response :success
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      api_delete v1_restaurant_url(@restaurant.uuid)
    end

    assert_response :no_content
  end
end
