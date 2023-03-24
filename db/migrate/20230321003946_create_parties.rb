class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :user_id
      t.date :party_date
      t.time :party_time
      t.integer :duration
      t.integer :movie_id

      t.timestamps
    end
  end
end
