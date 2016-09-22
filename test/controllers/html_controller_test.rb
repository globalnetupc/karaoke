require 'test_helper'

class HtmlControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get html_index_url
    assert_response :success
  end

end
