require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules(:one)
  end

  test "should get index" do
    get schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_schedule_url
    assert_response :success
  end

  test "should create schedule" do
    assert_difference('Schedule.count') do
      post schedules_url, params: { schedule: { friday_closes_at: @schedule.friday_closes_at, friday_opens_at: @schedule.friday_opens_at, monday_closes_at: @schedule.monday_closes_at, monday_opens_at: @schedule.monday_opens_at, restaurant_id: @schedule.restaurant_id, saturday_closes_at: @schedule.saturday_closes_at, saturday_opens_at: @schedule.saturday_opens_at, sunday_closes_at: @schedule.sunday_closes_at, sunday_opens_at: @schedule.sunday_opens_at, thursday_closes_at: @schedule.thursday_closes_at, thursday_opens_at: @schedule.thursday_opens_at, tuesday_closes_at: @schedule.tuesday_closes_at, tuesday_opens_at: @schedule.tuesday_opens_at, wednesday_closes_at: @schedule.wednesday_closes_at, wednesday_opens_at: @schedule.wednesday_opens_at } }
    end

    assert_redirected_to schedule_url(Schedule.last)
  end

  test "should show schedule" do
    get schedule_url(@schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_schedule_url(@schedule)
    assert_response :success
  end

  test "should update schedule" do
    patch schedule_url(@schedule), params: { schedule: { friday_closes_at: @schedule.friday_closes_at, friday_opens_at: @schedule.friday_opens_at, monday_closes_at: @schedule.monday_closes_at, monday_opens_at: @schedule.monday_opens_at, restaurant_id: @schedule.restaurant_id, saturday_closes_at: @schedule.saturday_closes_at, saturday_opens_at: @schedule.saturday_opens_at, sunday_closes_at: @schedule.sunday_closes_at, sunday_opens_at: @schedule.sunday_opens_at, thursday_closes_at: @schedule.thursday_closes_at, thursday_opens_at: @schedule.thursday_opens_at, tuesday_closes_at: @schedule.tuesday_closes_at, tuesday_opens_at: @schedule.tuesday_opens_at, wednesday_closes_at: @schedule.wednesday_closes_at, wednesday_opens_at: @schedule.wednesday_opens_at } }
    assert_redirected_to schedule_url(@schedule)
  end

  test "should destroy schedule" do
    assert_difference('Schedule.count', -1) do
      delete schedule_url(@schedule)
    end

    assert_redirected_to schedules_url
  end
end
