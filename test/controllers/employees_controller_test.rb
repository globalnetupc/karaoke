require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { dateIn: @employee.dateIn, dateOut: @employee.dateOut, dni: @employee.dni, email: @employee.email, firstName: @employee.firstName, group_id: @employee.group_id, id: @employee.id, isSystemUser: @employee.isSystemUser, isValid: @employee.isValid, languageIt: @employee.languageIt, lastName: @employee.lastName, password: @employee.password, userName: @employee.userName, validationOrigin: @employee.validationOrigin } }
    end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { dateIn: @employee.dateIn, dateOut: @employee.dateOut, dni: @employee.dni, email: @employee.email, firstName: @employee.firstName, group_id: @employee.group_id, id: @employee.id, isSystemUser: @employee.isSystemUser, isValid: @employee.isValid, languageIt: @employee.languageIt, lastName: @employee.lastName, password: @employee.password, userName: @employee.userName, validationOrigin: @employee.validationOrigin } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
