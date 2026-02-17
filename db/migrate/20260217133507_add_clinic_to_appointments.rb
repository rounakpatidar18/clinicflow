class AddClinicToAppointments < ActiveRecord::Migration[8.1]
  def up
    add_reference :appointments, :clinic, foreign_key: true

    default_clinic = Clinic.first

    Appointment.update_all(clinic_id: default_clinic.id)

    change_column_null :appointments, :clinic_id, false
  end

  def down
    remove_reference :appointments, :clinic
  end
end
