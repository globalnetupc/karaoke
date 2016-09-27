require 'test_helper'

class StatusCatalogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_catalog = status_catalogs(:one)
  end

  test "should get index" do
    get status_catalogs_url
    assert_response :success
  end

  test "should get new" do
    get new_status_catalog_url
    assert_response :success
  end

  test "should create status_catalog" do
    assert_difference('StatusCatalog.count') do
      post status_catalogs_url, params: { status_catalog: { status_catalog_id: @status_catalog.status_catalog_id, status_name: @status_catalog.status_name } }
    end

    assert_redirected_to status_catalog_url(StatusCatalog.last)
  end

  test "should show status_catalog" do
    get status_catalog_url(@status_catalog)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_catalog_url(@status_catalog)
    assert_response :success
  end

  test "should update status_catalog" do
    patch status_catalog_url(@status_catalog), params: { status_catalog: { status_catalog_id: @status_catalog.status_catalog_id, status_name: @status_catalog.status_name } }
    assert_redirected_to status_catalog_url(@status_catalog)
  end

  test "should destroy status_catalog" do
    assert_difference('StatusCatalog.count', -1) do
      delete status_catalog_url(@status_catalog)
    end

    assert_redirected_to status_catalogs_url
  end
end
