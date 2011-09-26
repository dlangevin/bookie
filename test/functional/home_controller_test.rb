require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  
  setup do
    @challenge = challenges(:one)
    @user = users(:one)
  end
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get index when a user is logged in" do
    sign_in @user
    get :index
    assert_response :success
  end
  
  test "should show the current user's challenges" do
    sign_in @user
    @challenge.update_attribute(:started_by, @user.id)
    
    get :index
    assert_response :success
    assert assigns(:current_users_challenges).include?(@challenge)
  end

end
