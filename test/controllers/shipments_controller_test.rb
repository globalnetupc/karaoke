require 'test_helper'

class ShipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment = shipments(:one)
  end

  test "should get index" do
    get shipments_url
    assert_response :success
  end

  test "should get new" do
    get new_shipment_url
    assert_response :success
  end

  test "should create shipment" do
    assert_difference('Shipment.count') do
      post shipments_url, params: { shipment: { billing_address: @shipment.billing_address, client_id: @shipment.client_id, delivery_cost: @shipment.delivery_cost, discount: @shipment.discount, final_price: @shipment.final_price, payment_type_id: @shipment.payment_type_id, products_price: @shipment.products_price, shipment_id: @shipment.shipment_id, shipment_type_id: @shipment.shipment_type_id, shipping_address: @shipment.shipping_address, time_created: @shipment.time_created } }
    end

    assert_redirected_to shipment_url(Shipment.last)
  end

  test "should show shipment" do
    get shipment_url(@shipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipment_url(@shipment)
    assert_response :success
  end

  test "should update shipment" do
    patch shipment_url(@shipment), params: { shipment: { billing_address: @shipment.billing_address, client_id: @shipment.client_id, delivery_cost: @shipment.delivery_cost, discount: @shipment.discount, final_price: @shipment.final_price, payment_type_id: @shipment.payment_type_id, products_price: @shipment.products_price, shipment_id: @shipment.shipment_id, shipment_type_id: @shipment.shipment_type_id, shipping_address: @shipment.shipping_address, time_created: @shipment.time_created } }
    assert_redirected_to shipment_url(@shipment)
  end

  test "should destroy shipment" do
    assert_difference('Shipment.count', -1) do
      delete shipment_url(@shipment)
    end

    assert_redirected_to shipments_url
  end
end
