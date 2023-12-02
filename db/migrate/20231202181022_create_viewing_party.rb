class CreateViewingParty < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.references :user, null: false, foreign_key: true
      t.string :movie_id
      t.integer :duration
      t.datetime :date
      t.time :start_time

      t.timestamps
    end
  end
end
