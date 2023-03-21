class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.datetime :event_datetime
      t.time :duration
      t.integer :movie_id

      t.timestamps
    end
  end
end
