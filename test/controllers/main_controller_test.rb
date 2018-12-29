require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get base" do
    get '/'
    assert_response :success
  end

  test "should get controllers" do
    get '/controllers'
    assert_response :success
  end

end
