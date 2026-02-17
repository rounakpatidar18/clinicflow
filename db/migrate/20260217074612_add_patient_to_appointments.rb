class AddPatientToAppointments < ActiveRecord::Migration[8.1]
  def change
    add_reference :appointments, :patient, foreign_key: true
  end
end
