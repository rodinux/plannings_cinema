require 'test_helper'

class EntreesControllerTest < ActionDispatch::IntegrationTest
  test "should get calcul_entrees" do
    get entrees_calcul_entrees_url
    assert_response :success
  end

end
