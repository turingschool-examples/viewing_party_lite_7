class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :host_id
      t.date :party_date
      t.time :party_time
      t.integer :duration

      t.timestamps
    end
  end
end
