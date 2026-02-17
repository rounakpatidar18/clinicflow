require "application_system_test_case"

class DashboardTest < ApplicationSystemTestCase
  test "viewing dashboard" do
    visit root_path

    assert_text "Clinic Dashboard"
  end
end
