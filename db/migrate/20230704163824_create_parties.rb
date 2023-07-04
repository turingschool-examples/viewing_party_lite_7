class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.integer :duration
      t.date :party_date
      t.time :party_time

      t.timestamps
    end
  end
end
