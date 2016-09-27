require 'test_helper'

class PaymentDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_detail = payment_details(:one)
  end

  test "should get index" do
    get payment_details_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_detail_url
    assert_response :success
  end

  test "should create payment_detail" do
    assert_difference('PaymentDetail.count') do
      post payment_details_url, params: { payment_detail: { payment_data_id: @payment_detail.payment_data_id, shipment_id: @payment_detail.shipment_id, value: @payment_detail.value } }
    end

    assert_redirected_to payment_detail_url(PaymentDetail.last)
  end

  test "should show payment_detail" do
    get payment_detail_url(@payment_detail)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_detail_url(@payment_detail)
    assert_response :success
  end

  test "should update payment_detail" do
    patch payment_detail_url(@payment_detail), params: { payment_detail: { payment_data_id: @payment_detail.payment_data_id, shipment_id: @payment_detail.shipment_id, value: @payment_detail.value } }
    assert_redirected_to payment_detail_url(@payment_detail)
  end

  test "should destroy payment_detail" do
    assert_difference('PaymentDetail.count', -1) do
      delete payment_detail_url(@payment_detail)
    end

    assert_redirected_to payment_details_url
  end
end
