require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
   @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
  
  test "ユーザーの存在検証" do
    assert @user.valid?
  end
  
  test "ユーザーが存在していないかの検証 (name)" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "ユーザーが存在していないかの検証 (email)" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end
  
  test "ユーザーが存在していないかの検証 (nameの長さ)" do
    @user.name = "a" * 100
    assert_not @user.valid?
  end
  
  test "重複したユーザーの検証" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "ダイジェストが存在しない場合のauthenticated?の検証" do
    assert_not @user.authenticated?(:remember, "")
  end
end
