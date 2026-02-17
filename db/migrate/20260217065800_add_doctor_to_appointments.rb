class AddDoctorToAppointments < ActiveRecord::Migration[7.1]
  def up
    # 1️⃣ Add column without NOT NULL
    add_reference :appointments, :doctor, foreign_key: true

    # 2️⃣ Create a default doctor
    default_doctor = Doctor.create!(
      name: "Default Doctor",
      specialization: "General"
    )

    # 3️⃣ Backfill existing appointments
    Appointment.reset_column_information
    Appointment.update_all(doctor_id: default_doctor.id)

    # 4️⃣ Add NOT NULL constraint
    change_column_null :appointments, :doctor_id, false
  end

  def down
    remove_reference :appointments, :doctor, foreign_key: true
  end
end
