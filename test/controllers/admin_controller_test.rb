require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get sign_in" do
    get :sign_in
    assert_response :success
  end

  test "should get survey_items" do
    get :survey_items
    assert_response :success
  end

  test "should get phone_numbers" do
    get :phone_numbers
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
