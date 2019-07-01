require 'test_helper'

class UserLoggedInTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "jonn", email: "john@example.com", password: "password")
  end

  test "get user login form and login" do
    get login_path
    sign_in_as(@user, "password")
    follow_redirect!
    assert_template 'users/show'
    assert_match "#{@user.username}", response.body
  end

end
