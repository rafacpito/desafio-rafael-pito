require "application_system_test_case"

class CitizensTest < ApplicationSystemTestCase
  setup do
    @citizen = citizens(:one)
  end

  test "visiting the index" do
    visit citizens_url
    assert_selector "h1", text: "Citizens"
  end

  test "creating a Citizen" do
    visit citizens_url
    click_on "New Citizen"

    fill_in "Fullname", with: @citizen.Fullname
    fill_in "Birth date", with: @citizen.birth_date
    fill_in "Cns", with: @citizen.cns
    fill_in "Cpf", with: @citizen.cpf
    fill_in "Email", with: @citizen.email
    fill_in "Photo", with: @citizen.photo
    check "Status" if @citizen.status
    fill_in "Telephone", with: @citizen.telephone
    click_on "Create Citizen"

    assert_text "Citizen was successfully created"
    click_on "Back"
  end

  test "updating a Citizen" do
    visit citizens_url
    click_on "Edit", match: :first

    fill_in "Fullname", with: @citizen.Fullname
    fill_in "Birth date", with: @citizen.birth_date
    fill_in "Cns", with: @citizen.cns
    fill_in "Cpf", with: @citizen.cpf
    fill_in "Email", with: @citizen.email
    fill_in "Photo", with: @citizen.photo
    check "Status" if @citizen.status
    fill_in "Telephone", with: @citizen.telephone
    click_on "Update Citizen"

    assert_text "Citizen was successfully updated"
    click_on "Back"
  end

  test "destroying a Citizen" do
    visit citizens_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Citizen was successfully destroyed"
  end
end
