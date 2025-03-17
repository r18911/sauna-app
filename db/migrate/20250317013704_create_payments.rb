class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.references :reservation,    null: false, foreign_key: true
      t.integer    :amount,         null: false
      t.integer    :payment_status, null: false, default: 0
      t.timestamps
    end
  end
end
