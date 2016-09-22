require 'test_helper'

class BoxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @box = boxes(:one)
  end

  test "should get index" do
    get boxes_url
    assert_response :success
  end

  test "should get new" do
    get new_box_url
    assert_response :success
  end

  test "should create box" do
    assert_difference('Box.count') do
      post boxes_url, params: { box: { box_id: @box.box_id, bussy: @box.bussy, description: @box.description, location_id: @box.location_id, name: @box.name, phone: @box.phone, score: @box.score } }
    end

    assert_redirected_to box_url(Box.last)
  end

  test "should show box" do
    get box_url(@box)
    assert_response :success
  end

  test "should get edit" do
    get edit_box_url(@box)
    assert_response :success
  end

  test "should update box" do
    patch box_url(@box), params: { box: { box_id: @box.box_id, bussy: @box.bussy, description: @box.description, location_id: @box.location_id, name: @box.name, phone: @box.phone, score: @box.score } }
    assert_redirected_to box_url(@box)
  end

  test "should destroy box" do
    assert_difference('Box.count', -1) do
      delete box_url(@box)
    end

    assert_redirected_to boxes_url
  end
end
