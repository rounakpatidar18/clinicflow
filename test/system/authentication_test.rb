require "application_system_test_case"

class AuthenticationTest < ApplicationSystemTestCase
  test "user login flow" do
    clinic = Clinic.create!(name: "Test Clinic", subdomain: "test")
    User.create!(
      clinic: clinic,
      name: "Admin",
      email: "admin@test.com",
      password: "password"
    )

    visit login_path

    fill_in "Email", with: "admin@test.com"
    fill_in "Password", with: "password"

    click_on "Login"

    assert_current_path root_path
    assert_text "Appointments"
  end
end
