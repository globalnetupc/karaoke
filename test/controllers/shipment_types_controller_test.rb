require 'test_helper'

class ShipmentTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment_type = shipment_types(:one)
  end

  test "should get index" do
    get shipment_types_url
    assert_response :success
  end

  test "should get new" do
    get new_shipment_type_url
    assert_response :success
  end

  test "should create shipment_type" do
    assert_difference('ShipmentType.count') do
      post shipment_types_url, params: { shipment_type: { shipment_type_id: @shipment_type.shipment_type_id, type_name: @shipment_type.type_name } }
    end

    assert_redirected_to shipment_type_url(ShipmentType.last)
  end

  test "should show shipment_type" do
    get shipment_type_url(@shipment_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipment_type_url(@shipment_type)
    assert_response :success
  end

  test "should update shipment_type" do
    patch shipment_type_url(@shipment_type), params: { shipment_type: { shipment_type_id: @shipment_type.shipment_type_id, type_name: @shipment_type.type_name } }
    assert_redirected_to shipment_type_url(@shipment_type)
  end

  test "should destroy shipment_type" do
    assert_difference('ShipmentType.count', -1) do
      delete shipment_type_url(@shipment_type)
    end

    assert_redirected_to shipment_types_url
  end
end
