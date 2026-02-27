require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  test "creating an appointment" do
    doctor = Doctor.create!(
      name: "Dr. System",
      specialization: "General"
    )

    patient = Patient.create!(
      name: "Jane Patient",
      phone: "8888888888"
    )

    visit appointments_path

    click_on "New Appointment"

    select doctor.name, from: "Doctor"
    select patient.name, from: "Patient"
    fill_in "Scheduled at", with: 1.day.from_now.strftime("%Y-%m-%dT%H:%M")
    select "Scheduled", from: "Status"

    click_on "Create Appointment"

    assert_text "Appointment created successfully."
    assert_text "Jane Patient"
  end
end
