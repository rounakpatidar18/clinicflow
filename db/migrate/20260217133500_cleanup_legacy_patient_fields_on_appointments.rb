class CleanupLegacyPatientFieldsOnAppointments < ActiveRecord::Migration[8.1]
  class MigrationAppointment < ActiveRecord::Base
    self.table_name = "appointments"
  end

  class MigrationPatient < ActiveRecord::Base
    self.table_name = "patients"
  end

  def up
    backfill_patient_references

    change_column_null :appointments, :patient_id, false
    remove_index :appointments, :patient_phone if index_exists?(:appointments, :patient_phone)
    remove_column :appointments, :patient_name if column_exists?(:appointments, :patient_name)
    remove_column :appointments, :patient_phone if column_exists?(:appointments, :patient_phone)
  end

  def down
    add_column :appointments, :patient_name, :string, null: false, default: ""
    add_column :appointments, :patient_phone, :string, null: false, default: ""
    add_index :appointments, :patient_phone unless index_exists?(:appointments, :patient_phone)

    execute <<~SQL.squish
      UPDATE appointments
      SET patient_name = patients.name,
          patient_phone = patients.phone
      FROM patients
      WHERE appointments.patient_id = patients.id
    SQL

    change_column_default :appointments, :patient_name, from: "", to: nil
    change_column_default :appointments, :patient_phone, from: "", to: nil
    change_column_null :appointments, :patient_id, true
  end

  private

  def backfill_patient_references
    say_with_time "Backfilling appointments.patient_id from legacy patient fields" do
      MigrationAppointment.reset_column_information
      MigrationPatient.reset_column_information

      MigrationAppointment.where(patient_id: nil).find_each do |appointment|
        patient = MigrationPatient.find_or_initialize_by(phone: appointment.patient_phone)
        patient.name = appointment.patient_name if patient.name.blank?
        patient.save!
        appointment.update_columns(patient_id: patient.id)
      end
    end
  end
end
