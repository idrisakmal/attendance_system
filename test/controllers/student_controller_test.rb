require 'test_helper'

class StudentControllerTest < ActionController::TestCase
  test "should get sign_in" do
    get :sign_in
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

end
