# frozen_string_literal: true

class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.datetime :date_time

      t.timestamps
    end
  end
end
