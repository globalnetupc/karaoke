require 'test_helper'

class CountryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get country_new_url
    assert_response :success
  end

  test "should get create" do
    get country_create_url
    assert_response :success
  end

  test "should get update" do
    get country_update_url
    assert_response :success
  end

  test "should get edit" do
    get country_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get country_destroy_url
    assert_response :success
  end

  test "should get index" do
    get country_index_url
    assert_response :success
  end

  test "should get show" do
    get country_show_url
    assert_response :success
  end

end
