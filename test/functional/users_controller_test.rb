require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "test the users action" do
    get :new
    assert_response 200

    assert_difference "User.count",1 do
      post :create,:user=>{:name=>"xiaowang",:age=>10}
      assert_redirected_to :action=>:index
    end
    user = User.last
    assert_equal [user.name, user.age],["xiaowang",10]

    user_id = user.id

    get :edit,:id=>user_id
    assert_response 200

    assert_difference "User.count",0 do
      put :update,:id=>user_id, :user=>{:name=>"xiaoli",:age=>8}
      assert_redirected_to :action=>:show,:id=>user_id
    end
    user.reload
    assert_equal [user.name, user.age],["xiaoli",8]

    assert_difference "User.count",-1 do 
      delete :destroy,:id=>user_id
    end
  end
end
