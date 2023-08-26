# frozen_string_literal: true

class CreateViewingParty < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.string :name
      t.string :host
      t.string :movie
      t.time :duration
      t.timestamp :viewing_time
      t.date :viewing_date
      t.string :users

      t.timestamps
    end
  end
end
