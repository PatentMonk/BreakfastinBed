require 'test_helper'

class CreditCardsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @password = "testingapi"
    @purchaser = Factory.create(:purchaser, password: @password, password_confirmation: @password)
    
    sign_in @purchaser
  end

  test "should get new" do
    get new_credit_card_url
    assert_response :success
  end

  test "should create credit_card" do
    credit_card = Factory.create(:credit_card, purchaser: create(:purchaser, password: @password, password_confirmation: @password))
    assert_difference('CreditCard.count') do
      post credit_cards_url, params: { credit_card: { month: credit_card.month, number: credit_card.number, purchaser_id: credit_card.purchaser_id, year: credit_card.year } }
    end

    assert_redirected_to credit_card_url(CreditCard.last)
  end

  test "should show credit_card" do
    credit_card = Factory.create(:credit_card, purchaser: @purchaser)
    get credit_card_url(credit_card)
    assert_response :success
  end

  test "should get edit" do
    credit_card = Factory.create(:credit_card, purchaser: @purchaser)
    get edit_credit_card_url(credit_card)
    assert_response :success
  end

  test "should update credit_card" do
    credit_card = Factory.create(:credit_card, purchaser: @purchaser)
    patch credit_card_url(credit_card), params: { credit_card: { month: credit_card.month, number: credit_card.number, purchaser_id: credit_card.purchaser_id, year: credit_card.year } }
    assert_redirected_to credit_card_url(credit_card)
  end

  test "should destroy credit_card" do
    credit_card = Factory.create(:credit_card, purchaser: @purchaser)
    assert_difference('CreditCard.count', -1) do
      delete credit_card_url(credit_card)
    end

    assert_redirected_to credit_cards_url
  end
end
