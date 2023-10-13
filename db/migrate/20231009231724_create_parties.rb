# frozen_string_literal: true

class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.date :date
      t.time :start_time
      t.integer :host_id

      t.timestamps
    end
  end
end
