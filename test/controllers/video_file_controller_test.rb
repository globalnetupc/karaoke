require 'test_helper'

class VideoFileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get video_file_index_url
    assert_response :success
  end

  test "should get new" do
    get video_file_new_url
    assert_response :success
  end

  test "should get create" do
    get video_file_create_url
    assert_response :success
  end

  test "should get destroy" do
    get video_file_destroy_url
    assert_response :success
  end

end
