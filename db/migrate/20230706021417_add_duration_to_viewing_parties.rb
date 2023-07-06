# frozen_string_literal: true

class AddDurationToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :duration, :string
    add_column :viewing_parties, :movie_title, :string
  end
end
