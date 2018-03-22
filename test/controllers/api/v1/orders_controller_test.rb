require 'test_helper'

class Api::V1::OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    password = "testingapi"
    user = Factory.create(:user, password: password, password_confirmation: password)
    @order = Factory.create(:order, purchaser: user)
    @auth_token = auth_in(user, password)
  end

  test "should get index" do
    api_get v1_orders_url
    assert_response :success
  end

  test "should get new" do
    api_get new_v1_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      api_post v1_orders_url, params: { order: { purchaser_id: @order.purchaser_id } }
    end

    assert_response :success
  end

  test "should show order" do
    api_get v1_order_url(@order.uuid)
    assert_response :success
  end

  test "should get edit" do
    api_get edit_v1_order_url(@order.uuid)
    assert_response :success
  end

  test "should update order" do
    api_patch v1_order_url(@order.uuid), params: { order: { purchaser_id: @order.purchaser_id } }
    assert_response :success
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      api_delete v1_order_url(@order.uuid)
    end

    assert_response :no_content
  end
end
