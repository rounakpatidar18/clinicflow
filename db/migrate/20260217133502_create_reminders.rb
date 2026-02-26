class CreateReminders < ActiveRecord::Migration[8.1]
  def change
    create_table :reminders do |t|
      t.references :appointment, null: false, foreign_key: true
      t.integer :reminder_type, null: false, default: 0
      t.datetime :sent_at
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :reminders, :status
    add_index :reminders, :reminder_type
    add_index :reminders, :sent_at
  end
end