# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.string :party_duration
      t.datetime :start_time
      t.string :movie_title
      t.string :movie_id

      t.timestamps
    end
  end
end
