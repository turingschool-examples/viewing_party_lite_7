class CreateParty < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.integer :duration
      t.string :date
      t.string :start_time

      t.timestamps
    end
  end
end
