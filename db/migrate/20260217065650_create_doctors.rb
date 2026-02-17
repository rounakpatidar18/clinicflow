class CreateDoctors < ActiveRecord::Migration[8.1]
  def change
    create_table :doctors do |t|
      t.string :name, null: false
      t.string :specialization, null: false

      t.timestamps
    end

    add_index :doctors, :name
  end
end
