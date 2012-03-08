require 'test_helper'

class IndexControllerTest < ActionController::TestCase
  
  test "access the index page" do
    get :index
    assert_response 200
  end

end
