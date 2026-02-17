require "application_system_test_case"

class PaymentsTest < ApplicationSystemTestCase
  test "adding a payment to appointment" do
    doctor = Doctor.create!(name: "Dr. Pay", specialization: "General")
    patient = Patient.create!(name: "Pay Patient", phone: "5555555555")

    appointment = Appointment.create!(
      scheduled_at: 1.day.from_now,
      status: :scheduled,
      doctor: doctor,
      patient: patient
    )

    visit appointment_path(appointment)

    click_on "Add Payment"

    fill_in "Amount", with: "1000"
    fill_in "Payment method", with: "cash"
    select "Paid", from: "Status"
    fill_in "Paid at", with: Time.current.strftime("%Y-%m-%dT%H:%M")

    click_on "Create Payment"

    assert_text "Payment recorded successfully."
    assert_text "$1,000.00"
  end
end
