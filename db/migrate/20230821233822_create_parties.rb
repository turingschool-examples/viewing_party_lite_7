# frozen_string_literal: true

class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.integer :duration
      t.string :date
      t.string :start_time
      t.references :host, foreign_key: { to_table: :users }
      t.string :movie_title
      t.string :thumbnail
      

      t.timestamps
    end
  end
end
