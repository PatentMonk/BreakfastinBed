#require 'test_helper'

#class OrderFoodItemsControllerTest < ActionDispatch::IntegrationTest
  #include Devise::Test::IntegrationHelpers
  #setup do
    #@food_item = Factory.create(:order_food_item)
    #password = "testingapi"
    #sign_in Factory.create(:user, password: password, password_confirmation: password)
  #end

  #test "should get index" do
    #get order_food_items_url
    #assert_response :success
  #end

  #test "should get new" do
    #get new_order_food_item_url
    #assert_response :success
  #end

  #test "should create food_item" do
    #assert_difference('OrderFoodItem.count') do
      #post order_food_items_url, params: { food_item: { description_id: @food_item.description_id, image_url: @food_item.image_url, name: @food_item.name, price: @food_item.price } }
    #end

    #assert_redirected_to order_food_item_url(OrderFoodItem.last)
  #end

  #test "should show food_item" do
    #get order_food_item_url(@food_item)
    #assert_response :success
  #end

  #test "should get edit" do
    #get edit_order_food_item_url(@food_item)
    #assert_response :success
  #end

  #test "should update food_item" do
    #patch order_food_item_url(@food_item), params: { food_item: { description_id: @food_item.description_id, image_url: @food_item.image_url, name: @food_item.name, price: @food_item.price } }
    #assert_redirected_to food_item_url(@food_item)
  #end

  #test "should destroy food_item" do
    #assert_difference('OrderFoodItem.count', -1) do
      #delete order_food_item_url(@food_item)
    #end

    #assert_redirected_to order_food_items_url
  #end
#end
