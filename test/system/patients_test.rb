require "application_system_test_case"

class PatientsTest < ApplicationSystemTestCase
  test "creating a patient" do
    visit patients_path

    click_on "New Patient"

    fill_in "Name", with: "Alice Test"
    fill_in "Phone", with: "7777777777"
    fill_in "Email", with: "alice@test.com"
    fill_in "Date of birth", with: "1990-01-01"

    click_on "Create Patient"

    assert_text "Patient created successfully."
    assert_text "Alice Test"
  end
end
