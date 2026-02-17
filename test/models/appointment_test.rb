require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @appointment = Appointment.new(
      patient_name: "John Doe",
      patient_phone: "9999999999",
      scheduled_at: 1.day.from_now,
      status: :scheduled
    )
  end

  test "valid appointment" do
    assert @appointment.valid?
  end

  test "invalid without patient_name" do
    @appointment.patient_name = nil
    assert_not @appointment.valid?
  end

  test "invalid without patient_phone" do
    @appointment.patient_phone = nil
    assert_not @appointment.valid?
  end

  test "invalid without scheduled_at" do
    @appointment.scheduled_at = nil
    assert_not @appointment.valid?
  end

  test "invalid if scheduled_at in past" do
    @appointment.scheduled_at = 1.day.ago
    assert_not @appointment.valid?
  end

  test "enum values are defined" do
    assert_equal 0, Appointment.statuses[:scheduled]
    assert_equal 1, Appointment.statuses[:completed]
    assert_equal 2, Appointment.statuses[:cancelled]
    assert_equal 3, Appointment.statuses[:no_show]
  end

  test "upcoming scope returns future appointments" do
    future = Appointment.create!(
      patient_name: "Future",
      patient_phone: "1111111111",
      scheduled_at: 2.days.from_now,
      status: :scheduled
    )

    past = Appointment.create!(
      patient_name: "Past",
      patient_phone: "2222222222",
      scheduled_at: 2.days.from_now,
      status: :completed
    )

    assert_includes Appointment.upcoming, future
  end
end
