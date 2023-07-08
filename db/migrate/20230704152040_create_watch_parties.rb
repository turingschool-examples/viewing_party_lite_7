class CreateWatchParties < ActiveRecord::Migration[7.0]
  def change
    create_table :watch_parties do |t|
      t.string :date
      t.integer :duration
      t.string :start_time
      t.string :movie_title

      t.timestamps
    end
  end
end
