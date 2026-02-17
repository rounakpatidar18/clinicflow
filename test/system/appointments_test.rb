require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  test "creating an appointment" do
    doctor = Doctor.create!(
      name: "Dr. System",
      specialization: "General"
    )

    visit appointments_path

    click_on "New Appointment"

    select doctor.name, from: "Doctor"
    fill_in "Patient name", with: "John Doe"
    fill_in "Patient phone", with: "9999999999"
    fill_in "Scheduled at", with: 1.day.from_now.strftime("%Y-%m-%dT%H:%M")
    select "Scheduled", from: "Status"

    click_on "Create Appointment"

    assert_text "Appointment created successfully."
    assert_text "John Doe"
  end
end
