class CreateAppointments < ActiveRecord::Migration[8.1]
  def change
    create_table :appointments do |t|
      t.string :patient_name, null: false
      t.string :patient_phone, null: false
      t.datetime :scheduled_at, null: false
      t.integer :status, null: false, default: 0
      t.text :notes

      t.timestamps
    end

    add_index :appointments, :scheduled_at
    add_index :appointments, :status
    add_index :appointments, :patient_phone
  end
end
