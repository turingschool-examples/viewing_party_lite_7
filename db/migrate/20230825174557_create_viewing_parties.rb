class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.string :date
      t.datetime :start_time

      t.timestamps
    end
  end
end
