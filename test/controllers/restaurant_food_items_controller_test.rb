#require 'test_helper'
#
#class RestaurantFoodItemsControllerTest < ActionDispatch::IntegrationTest
  #include Devise::Test::IntegrationHelpers
  #setup do
    #@food_item = Factory.create(:restaurant_food_item)
    #password = "testingapi"
    #sign_in Factory.create(:user, password: password, password_confirmation: password)
  #end
#
  #test "should get index" do
    #get restaurant_food_items_url
    #assert_response :success
  #end
#
  #test "should get new" do
    #get new_restaurant_food_item_url
    #assert_response :success
  #end
#
  #test "should create food_item" do
    #assert_difference('RestaurantFoodItem.count') do
      #post restaurant_food_items_url, params: { food_item: { description_id: @food_item.description_id, image_url: @food_item.image_url, name: @food_item.name, price: @food_item.price } }
    #end
#
    #assert_redirected_to restaurant_food_item_url(RestaurantFoodItem.last)
  #end
#
  #test "should show food_item" do
    #get restaurant_food_item_url(@food_item)
    #assert_response :success
  #end
#
  #test "should get edit" do
    #get edit_restaurant_food_item_url(@food_item)
    #assert_response :success
  #end
#
  #test "should update food_item" do
    #patch restaurant_food_item_url(@food_item), params: { food_item: { description_id: @food_item.description_id, image_url: @food_item.image_url, name: @food_item.name, price: @food_item.price } }
    #assert_redirected_to food_item_url(@food_item)
  #end
#
  #test "should destroy food_item" do
    #assert_difference('RestaurantFoodItem.count', -1) do
      #delete restaurant_food_item_url(@food_item)
    #end
#
    #assert_redirected_to restaurant_food_items_url
  #end
#end
