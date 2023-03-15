require 'test_helper'

class CitizensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @citizen = citizens(:one)
  end

  test "should get index" do
    get citizens_url
    assert_response :success
  end

  test "should get new" do
    get new_citizen_url
    assert_response :success
  end

  test "should create citizen" do
    assert_difference('Citizen.count') do
      post citizens_url, params: { citizen: { Fullname: @citizen.Fullname, birth_date: @citizen.birth_date, cns: @citizen.cns, cpf: @citizen.cpf, email: @citizen.email, photo: @citizen.photo, status: @citizen.status, telephone: @citizen.telephone } }
    end

    assert_redirected_to citizen_url(Citizen.last)
  end

  test "should show citizen" do
    get citizen_url(@citizen)
    assert_response :success
  end

  test "should get edit" do
    get edit_citizen_url(@citizen)
    assert_response :success
  end

  test "should update citizen" do
    patch citizen_url(@citizen), params: { citizen: { Fullname: @citizen.Fullname, birth_date: @citizen.birth_date, cns: @citizen.cns, cpf: @citizen.cpf, email: @citizen.email, photo: @citizen.photo, status: @citizen.status, telephone: @citizen.telephone } }
    assert_redirected_to citizen_url(@citizen)
  end

  test "should destroy citizen" do
    assert_difference('Citizen.count', -1) do
      delete citizen_url(@citizen)
    end

    assert_redirected_to citizens_url
  end
end
