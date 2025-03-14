class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.references :user,           null: false, foreign_key: true
      t.references :room,           null: false, foreign_key: true
      t.datetime :start_time,       null: false
      t.datetime :end_time,         null: false
      t.integer :number_of_people,  null: false
      t.integer :status,            null: false
      t.timestamps
    end
  end
end
