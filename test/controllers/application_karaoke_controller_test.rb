require 'test_helper'

class ApplicationKaraokeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get application_karaoke_index_url
    assert_response :success
  end

end
