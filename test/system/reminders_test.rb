require "application_system_test_case"

class RemindersTest < ApplicationSystemTestCase
  test "adding reminder to appointment" do
    doctor = Doctor.create!(name: "Dr. R", specialization: "General")
    patient = Patient.create!(name: "R Patient", phone: "3333333333")

    appointment = Appointment.create!(
      scheduled_at: 1.day.from_now,
      status: :scheduled,
      doctor: doctor,
      patient: patient
    )

    visit appointment_path(appointment)

    click_on "Add Reminder"

    select "Sms", from: "Reminder type"
    select "Pending", from: "Status"

    click_on "Create Reminder"

    assert_text "Reminder created successfully."
    assert_text "Sms"
  end
end
