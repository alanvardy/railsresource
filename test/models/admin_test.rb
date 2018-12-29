require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Good username and password logs in successfully" do
    admin = Admin.new(username: 'foo', password: 'bar')
    assert admin.login_valid?
  end

  test "Bad username fails login" do
    admin = Admin.new(username: 'blah', password: 'bar')
    assert_not admin.login_valid?
  end

  test "Bad password fails login" do
    admin = Admin.new(username: 'foo', password: 'bananas')
    assert_not admin.login_valid?
  end
end
