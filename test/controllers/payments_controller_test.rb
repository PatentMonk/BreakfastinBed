require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @payment = Factory.create(:payment)
    password = "testingapi"
    sign_in Factory.create(:user, password: password, password_confirmation: password)
  end

  test "should get index" do
    get payments_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_url
    assert_response :success
  end

  test "should create payment" do
    assert_difference('Payment.count') do
      post payments_url, params: { payment: { credit_card_id: @payment.credit_card_id, order_id: @payment.order_id } }
    end

    assert_redirected_to payment_url(Payment.last)
  end

  test "should show payment" do
    get payment_url(@payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_url(@payment)
    assert_response :success
  end

  test "should update payment" do
    patch payment_url(@payment), params: { payment: { credit_card_id: @payment.credit_card_id, order_id: @payment.order_id } }
    assert_redirected_to payment_url(@payment)
  end

  test "should destroy payment" do
    assert_difference('Payment.count', -1) do
      delete payment_url(@payment)
    end

    assert_redirected_to payments_url
  end
end
