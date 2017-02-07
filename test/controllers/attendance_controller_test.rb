require 'test_helper'

class AttendanceControllerTest < ActionController::TestCase
  test "should get section_attendances" do
    get :section_attendances
    assert_response :success
  end

  test "should get student_attendances" do
    get :student_attendances
    assert_response :success
  end

end
