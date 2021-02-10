require "test_helper"

class AgendaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get agenda_index_url
    assert_response :success
  end
end
