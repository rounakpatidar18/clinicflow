require "test_helper"

class DashboardMetricsTest < ActiveSupport::TestCase
  test "calculates metrics correctly" do
    doctor = Doctor.create!(name: "Dr. D", specialization: "General")
    patient = Patient.create!(name: "Dash Patient", phone: "2222222222")

    appointment = Appointment.create!(
      scheduled_at: 1.day.from_now,
      status: :completed,
      doctor: doctor,
      patient: patient
    )

    Payment.create!(
      appointment: appointment,
      amount: 1000,
      payment_method: "cash",
      status: :paid
    )

    Reminder.create!(
      appointment: appointment,
      reminder_type: :sms,
      status: :pending
    )

    metrics = DashboardMetrics.new

    assert_equal 1, metrics.total_appointments
    assert_equal 0, metrics.upcoming_appointments
    assert_equal 1, metrics.completed_appointments
    assert_equal 1000, metrics.total_revenue
    assert_equal 0, metrics.pending_payments
    assert_equal 1, metrics.pending_reminders
  end
end
