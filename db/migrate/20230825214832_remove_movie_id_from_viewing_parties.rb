# frozen_string_literal: true

class RemoveMovieIdFromViewingParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :viewing_parties, :movie_id
  end
end
