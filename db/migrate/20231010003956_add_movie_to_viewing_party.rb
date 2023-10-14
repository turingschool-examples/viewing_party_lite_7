# frozen_string_literal: true

class AddMovieToViewingParty < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :movie, :integer
  end
end
