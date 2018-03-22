require 'test_helper'

class Api::V1::RestaurantFoodItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    address = create(:address)
    restaurant = create(:restaurant, address: address)
    @description = create(:description)
    @restaurant_food_item = Factory.create(:restaurant_food_item, food_itemable: restaurant)
    password = "testingapi"
    user = Factory.create(:user, password: password, password_confirmation: password)
    @auth_token = auth_in(user, password)
  end

  test "should get index" do
    api_get v1_restaurant_restaurant_food_items_url(@restaurant_food_item.food_itemable.uuid) 
    assert_response :success
  end

  test "should get new" do
    api_get new_v1_restaurant_restaurant_food_item_url(@restaurant_food_item.food_itemable.uuid) 
    assert_response :success
  end

  test "should create restaurant_food_item" do
    assert_difference('RestaurantFoodItem.count') do
      api_post v1_restaurant_restaurant_food_items_url(@restaurant_food_item.food_itemable.uuid), params: { restaurant_food_item: { description_id: @description.uuid, image_url: @restaurant_food_item.image_url, name: @restaurant_food_item.name, price: @restaurant_food_item.price } }
    end

    assert_response :created
  end

  test "should show restaurant_food_item" do
    api_get v1_restaurant_restaurant_food_item_url(@restaurant_food_item.food_itemable.uuid, @restaurant_food_item.uuid)
    assert_response :success
  end

  test "should get edit" do
    api_get edit_v1_restaurant_restaurant_food_item_url(@restaurant_food_item.food_itemable.uuid, @restaurant_food_item.uuid)
    assert_response :success
  end

  test "should update restaurant_food_item" do
    api_patch v1_restaurant_restaurant_food_item_url(@restaurant_food_item.food_itemable.uuid, @restaurant_food_item.uuid), params: { restaurant_food_item: { description_id: @description.uuid, image_url: @restaurant_food_item.image_url, name: @restaurant_food_item.name, price: @restaurant_food_item.price } }
    assert_response :success
  end

  test "should destroy restaurant_food_item" do
    assert_difference('RestaurantFoodItem.count', -1) do
      api_delete v1_restaurant_restaurant_food_item_url(@restaurant_food_item.food_itemable.uuid, @restaurant_food_item.uuid)
    end

    assert_response :no_content
  end
end
