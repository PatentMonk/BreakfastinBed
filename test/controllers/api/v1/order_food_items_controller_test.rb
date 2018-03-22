require 'test_helper'

class Api::V1::OrderFoodItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @description = create(:description)
    @order_food_item = Factory.create(:order_food_item, food_itemable: create(:order))
    password = "testingapi"
    user = Factory.create(:user, password: password, password_confirmation: password)
    @auth_token = auth_in(user, password)
  end

  test "should get index" do
    api_get v1_order_order_food_items_url(@order_food_item.food_itemable.uuid) 
    assert_response :success
  end

  test "should get new" do
    api_get new_v1_order_order_food_item_url(@order_food_item.food_itemable.uuid) 
    assert_response :success
  end

  test "should create order_food_item" do
    assert_difference('OrderFoodItem.count') do
      api_post v1_order_order_food_items_url(@order_food_item.food_itemable.uuid), params: { order_food_item: { description_id: @description.uuid, image_url: @order_food_item.image_url, name: @order_food_item.name, price: @order_food_item.price } }
    end

    assert_response :created
  end

  test "should show order_food_item" do
    api_get v1_order_order_food_item_url(@order_food_item.food_itemable.uuid, @order_food_item.uuid)
    assert_response :success
  end

  test "should get edit" do
    api_get edit_v1_order_order_food_item_url(@order_food_item.food_itemable.uuid, @order_food_item.uuid)
    assert_response :success
  end

  test "should update order_food_item" do
    api_patch v1_order_order_food_item_url(@order_food_item.food_itemable.uuid, @order_food_item.uuid), params: { order_food_item: { description_id: @description.uuid, image_url: @order_food_item.image_url, name: @order_food_item.name, price: @order_food_item.price } }
    assert_response :success
  end

  test "should destroy order_food_item" do
    assert_difference('OrderFoodItem.count', -1) do
      api_delete v1_order_order_food_item_url(@order_food_item.food_itemable.uuid, @order_food_item.uuid)
    end

    assert_response :no_content
  end
end
