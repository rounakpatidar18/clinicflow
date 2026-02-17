require "test_helper"

class PaymentTest < ActiveSupport::TestCase
  def setup
    @doctor = Doctor.create!(
      name: "Dr. Pay",
      specialization: "General"
    )

    @patient = Patient.create!(
      name: "Payment Patient",
      phone: "6666666666"
    )

    @appointment = Appointment.create!(
      scheduled_at: 1.day.from_now,
      status: :scheduled,
      doctor: @doctor,
      patient: @patient
    )

    @payment = Payment.new(
      appointment: @appointment,
      amount: 500.00,
      payment_method: "cash",
      status: :pending
    )
  end

  test "valid payment" do
    assert @payment.valid?
  end

  test "invalid without amount" do
    @payment.amount = nil
    assert_not @payment.valid?
  end

  test "invalid with zero amount" do
    @payment.amount = 0
    assert_not @payment.valid?
  end

  test "invalid without payment_method" do
    @payment.payment_method = nil
    assert_not @payment.valid?
  end

  test "invalid without appointment" do
    @payment.appointment = nil
    assert_not @payment.valid?
  end

  test "enum values are defined" do
    assert_equal 0, Payment.statuses[:pending]
    assert_equal 1, Payment.statuses[:paid]
    assert_equal 2, Payment.statuses[:failed]
    assert_equal 3, Payment.statuses[:refunded]
  end
end
