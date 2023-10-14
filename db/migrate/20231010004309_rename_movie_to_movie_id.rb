# frozen_string_literal: true

class RenameMovieToMovieId < ActiveRecord::Migration[7.0]
  def change
    rename_column :viewing_parties, :movie, :movie_id
  end
end
