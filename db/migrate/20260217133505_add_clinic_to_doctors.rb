class AddClinicToDoctors < ActiveRecord::Migration[8.1]
  def up
    add_reference :doctors, :clinic, foreign_key: true

    default_clinic = Clinic.first || Clinic.create!(
      name: "Default Clinic",
      subdomain: "default"
    )

    Doctor.update_all(clinic_id: default_clinic.id)

    change_column_null :doctors, :clinic_id, false
  end

  def down
    remove_reference :doctors, :clinic
  end
end
