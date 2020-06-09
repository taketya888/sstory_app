require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @another = users(:mayoi)
  end
  
  test "should get new" do
    get signup_path
    assert_response :success
  end
  
  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { name: @user.name,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@another)
    get edit_user_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect update when logged in as wrong user" do
    log_in_as(@another)
    patch user_path(@user), params: { user: { name:@user.name,
                                              email: @user.email }}
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect index when not logged in" do
    get users_path
    assert_redirected_to login_url
  end
  
  test "dont show delete botton" do
    log_in_as(@another)
    get user_path(@user)
    assert_select "a" , text: "削除" , count:0
  end
  
  test "show delete botton and delete and logout" do
    log_in_as(@user)
    get user_path(@user)
    assert_select "a", text: "削除" , count:1
    delete user_path(@user)
    assert_redirected_to root_url
    assert_not flash.empty?
    #assert_select "a[href=?]", login_path
  end
end
