class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :host_user_id
      t.time :start_time
      t.date :date
      t.integer :duration
      t.integer :movie_id

      t.timestamps
    end
  end
end
