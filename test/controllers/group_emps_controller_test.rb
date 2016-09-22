require 'test_helper'

class GroupEmpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_emp = group_emps(:one)
  end

  test "should get index" do
    get group_emps_url
    assert_response :success
  end

  test "should get new" do
    get new_group_emp_url
    assert_response :success
  end

  test "should create group_emp" do
    assert_difference('GroupEmp.count') do
      post group_emps_url, params: { group_emp: { description: @group_emp.description, id: @group_emp.id, levelGroup: @group_emp.levelGroup } }
    end

    assert_redirected_to group_emp_url(GroupEmp.last)
  end

  test "should show group_emp" do
    get group_emp_url(@group_emp)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_emp_url(@group_emp)
    assert_response :success
  end

  test "should update group_emp" do
    patch group_emp_url(@group_emp), params: { group_emp: { description: @group_emp.description, id: @group_emp.id, levelGroup: @group_emp.levelGroup } }
    assert_redirected_to group_emp_url(@group_emp)
  end

  test "should destroy group_emp" do
    assert_difference('GroupEmp.count', -1) do
      delete group_emp_url(@group_emp)
    end

    assert_redirected_to group_emps_url
  end
end
