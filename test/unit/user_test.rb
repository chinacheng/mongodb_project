# encoding: utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "new user test" do
    assert_equal User.count,0
    assert_difference "User.count",1 do
      User.create(:name=>"王华",:age=>18)
    end
    user = User.last
    assert_equal user.name, "王华"
    assert_equal user.age, 18
  end

end
