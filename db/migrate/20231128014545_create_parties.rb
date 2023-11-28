class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.date :party_date
      t.time :start_time
      t.integer :host_id
      t.integer :duration_of_party

      t.timestamps
    end
  end
end
