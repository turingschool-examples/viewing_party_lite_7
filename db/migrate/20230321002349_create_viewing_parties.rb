class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration_minutes
      t.date :party_date
      t.time :party_time
      t.integer :host_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
