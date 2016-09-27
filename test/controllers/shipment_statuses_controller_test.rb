require 'test_helper'

class ShipmentStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment_status = shipment_statuses(:one)
  end

  test "should get index" do
    get shipment_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_shipment_status_url
    assert_response :success
  end

  test "should create shipment_status" do
    assert_difference('ShipmentStatus.count') do
      post shipment_statuses_url, params: { shipment_status: { notes: @shipment_status.notes, shipment_id: @shipment_status.shipment_id, status_catalog_id: @shipment_status.status_catalog_id, status_time: @shipment_status.status_time } }
    end

    assert_redirected_to shipment_status_url(ShipmentStatus.last)
  end

  test "should show shipment_status" do
    get shipment_status_url(@shipment_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipment_status_url(@shipment_status)
    assert_response :success
  end

  test "should update shipment_status" do
    patch shipment_status_url(@shipment_status), params: { shipment_status: { notes: @shipment_status.notes, shipment_id: @shipment_status.shipment_id, status_catalog_id: @shipment_status.status_catalog_id, status_time: @shipment_status.status_time } }
    assert_redirected_to shipment_status_url(@shipment_status)
  end

  test "should destroy shipment_status" do
    assert_difference('ShipmentStatus.count', -1) do
      delete shipment_status_url(@shipment_status)
    end

    assert_redirected_to shipment_statuses_url
  end
end
