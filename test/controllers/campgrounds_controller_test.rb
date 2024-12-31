require "test_helper"

class CampgroundsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campground = campgrounds(:one)
  end

  test "should get index" do
    get campgrounds_url, as: :json
    assert_response :success
  end

  test "should create campground" do
    assert_difference("Campground.count") do
      post campgrounds_url, params: { campground: {} }, as: :json
    end

    assert_response :created
  end

  test "should show campground" do
    get campground_url(@campground), as: :json
    assert_response :success
  end

  test "should update campground" do
    patch campground_url(@campground), params: { campground: {} }, as: :json
    assert_response :success
  end

  test "should destroy campground" do
    assert_difference("Campground.count", -1) do
      delete campground_url(@campground), as: :json
    end

    assert_response :no_content
  end
end
