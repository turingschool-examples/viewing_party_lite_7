# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :movie_id
      t.string :movie_title
      t.string :movie_image
      t.integer :duration
      t.date :date
      t.time :start_time

      t.timestamps
    end
  end
end
