class CreatePayments < ActiveRecord::Migration[8.1]
  def change
    create_table :payments do |t|
      t.references :appointment, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.string :payment_method, null: false
      t.integer :status, null: false, default: 0
      t.datetime :paid_at

      t.timestamps
    end

    add_index :payments, :status
    add_index :payments, :paid_at
  end
end
