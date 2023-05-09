# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.date :date
      t.time :start_time
      t.integer :duration
      t.integer :movie_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
