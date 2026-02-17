require "test_helper"

class DoctorTest < ActiveSupport::TestCase
  def setup
    clinic = Clinic.create!(name: "Clinic Test", subdomain: "clinic-test")

    @doctor = Doctor.new(
      name: "Dr. Smith",
      specialization: "Cardiology",
      clinic: clinic
    )
  end

  test "valid doctor" do
    assert @doctor.valid?
  end

  test "invalid without name" do
    @doctor.name = nil
    assert_not @doctor.valid?
  end

  test "invalid without specialization" do
    @doctor.specialization = nil
    assert_not @doctor.valid?
  end

  test "has many appointments" do
    assert_respond_to @doctor, :appointments
  end
end
