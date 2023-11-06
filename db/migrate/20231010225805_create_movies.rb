# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :vote_average
      t.integer :runtime
      t.string :genres
      t.string :description
      t.timestamps
    end
  end
end
