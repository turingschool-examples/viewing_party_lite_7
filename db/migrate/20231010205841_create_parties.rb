class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.string :movie_title
      t.integer :duration
      t.date :date
      t.time :start_time

      t.timestamps
    end
  end
end
