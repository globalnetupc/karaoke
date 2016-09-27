require 'test_helper'

class PaymentDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_datum = payment_data(:one)
  end

  test "should get index" do
    get payment_data_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_datum_url
    assert_response :success
  end

  test "should create payment_datum" do
    assert_difference('PaymentDatum.count') do
      post payment_data_url, params: { payment_datum: { data_name: @payment_datum.data_name, data_type: @payment_datum.data_type, payment_data_id: @payment_datum.payment_data_id, payment_type_id: @payment_datum.payment_type_id } }
    end

    assert_redirected_to payment_datum_url(PaymentDatum.last)
  end

  test "should show payment_datum" do
    get payment_datum_url(@payment_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_datum_url(@payment_datum)
    assert_response :success
  end

  test "should update payment_datum" do
    patch payment_datum_url(@payment_datum), params: { payment_datum: { data_name: @payment_datum.data_name, data_type: @payment_datum.data_type, payment_data_id: @payment_datum.payment_data_id, payment_type_id: @payment_datum.payment_type_id } }
    assert_redirected_to payment_datum_url(@payment_datum)
  end

  test "should destroy payment_datum" do
    assert_difference('PaymentDatum.count', -1) do
      delete payment_datum_url(@payment_datum)
    end

    assert_redirected_to payment_data_url
  end
end
