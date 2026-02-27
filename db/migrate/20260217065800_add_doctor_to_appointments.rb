class AddDoctorToAppointments < ActiveRecord::Migration[7.1]
  def up
    add_reference :appointments, :doctor, foreign_key: true unless column_exists?(:appointments, :doctor_id)

    appointment_model = Class.new(ActiveRecord::Base) do
      self.table_name = "appointments"
    end

    doctor_model = Class.new(ActiveRecord::Base) do
      self.table_name = "doctors"
    end

    default_doctor_id = doctor_model.minimum(:id)
    unless default_doctor_id
      default_doctor_id = doctor_model.create!(name: "Default Doctor", specialization: "General").id
    end

    appointment_model.update_all(doctor_id: default_doctor_id)

    change_column_null :appointments, :doctor_id, false
  end

  def down
    remove_reference :appointments, :doctor, foreign_key: true if column_exists?(:appointments, :doctor_id)
  end
end
