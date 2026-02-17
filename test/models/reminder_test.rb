require "test_helper"

class ReminderTest < ActiveSupport::TestCase
  def setup
    doctor = Doctor.create!(name: "Dr. Reminder", specialization: "General")
    patient = Patient.create!(name: "Reminder Patient", phone: "4444444444")

    @appointment = Appointment.create!(
      scheduled_at: 1.day.from_now,
      status: :scheduled,
      doctor: doctor,
      patient: patient
    )

    @reminder = Reminder.new(
      appointment: @appointment,
      reminder_type: :sms,
      status: :pending
    )
  end

  test "valid reminder" do
    assert @reminder.valid?
  end

  test "invalid without appointment" do
    @reminder.appointment = nil
    assert_not @reminder.valid?
  end

  test "invalid without reminder_type" do
    @reminder.reminder_type = nil
    assert_not @reminder.valid?
  end

  test "enum values defined" do
    assert_equal 0, Reminder.reminder_types[:sms]
    assert_equal 1, Reminder.reminder_types[:email]
    assert_equal 2, Reminder.reminder_types[:call]
  end
end
