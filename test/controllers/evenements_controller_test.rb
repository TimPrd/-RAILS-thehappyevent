require 'test_helper'

class EvenementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get evenements_new_url
    assert_response :success
  end

end
