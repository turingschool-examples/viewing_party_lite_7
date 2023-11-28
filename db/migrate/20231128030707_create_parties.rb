class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.string :movie_title
      t.integer :duration
      t.date :when
      t.time :start_time

      t.timestamps
    end
  end
end
