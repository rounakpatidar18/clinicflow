class AddClinicToPatients < ActiveRecord::Migration[8.1]
  def up
    add_reference :patients, :clinic, foreign_key: true

    default_clinic = Clinic.first

    Patient.update_all(clinic_id: default_clinic.id)

    change_column_null :patients, :clinic_id, false
  end

  def down
    remove_reference :patients, :clinic
  end
end
