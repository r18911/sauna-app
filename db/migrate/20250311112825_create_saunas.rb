class CreateSaunas < ActiveRecord::Migration[7.1]
  def change
    create_table :saunas do |t|

      t.timestamps
    end
  end
end
