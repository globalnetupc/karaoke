require 'test_helper'

class ShipmentDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment_detail = shipment_details(:one)
  end

  test "should get index" do
    get shipment_details_url
    assert_response :success
  end

  test "should get new" do
    get new_shipment_detail_url
    assert_response :success
  end

  test "should create shipment_detail" do
    assert_difference('ShipmentDetail.count') do
      post shipment_details_url, params: { shipment_detail: { price: @shipment_detail.price, price_per_unit: @shipment_detail.price_per_unit, product_id: @shipment_detail.product_id, quanitity: @shipment_detail.quanitity, shipment_id: @shipment_detail.shipment_id } }
    end

    assert_redirected_to shipment_detail_url(ShipmentDetail.last)
  end

  test "should show shipment_detail" do
    get shipment_detail_url(@shipment_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipment_detail_url(@shipment_detail)
    assert_response :success
  end

  test "should update shipment_detail" do
    patch shipment_detail_url(@shipment_detail), params: { shipment_detail: { price: @shipment_detail.price, price_per_unit: @shipment_detail.price_per_unit, product_id: @shipment_detail.product_id, quanitity: @shipment_detail.quanitity, shipment_id: @shipment_detail.shipment_id } }
    assert_redirected_to shipment_detail_url(@shipment_detail)
  end

  test "should destroy shipment_detail" do
    assert_difference('ShipmentDetail.count', -1) do
      delete shipment_detail_url(@shipment_detail)
    end

    assert_redirected_to shipment_details_url
  end
end
