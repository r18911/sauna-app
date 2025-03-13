class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string  :name
      t.text    :description
      t.integer :size
      t.string  :bed_type
      t.text    :facilities
      t.integer :capacity
      t.integer :price
      t.timestamps
    end
  end
end
