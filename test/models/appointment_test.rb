require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @doctor = Doctor.create!(
      name: "Dr. Test",
      specialization: "General"
    )

    @patient = Patient.create!(
      name: "John Doe",
      phone: "9999999999"
    )

    @appointment = Appointment.new(
      scheduled_at: 1.day.from_now,
      status: :scheduled,
      doctor: @doctor,
      patient: @patient
    )
  end

  test "valid appointment" do
    assert @appointment.valid?
  end

  test "invalid without patient" do
    @appointment.patient = nil
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

  test "invalid without doctor" do
    @appointment.doctor = nil
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
      scheduled_at: 2.days.from_now,
      status: :scheduled,
      doctor: @doctor,
      patient: @patient
    )

    assert_includes Appointment.upcoming, future
  end
end
