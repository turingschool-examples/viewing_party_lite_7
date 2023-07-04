# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.date :day
      t.time :start_time
      t.integer :movie_id

      t.timestamps
    end
  end
end
