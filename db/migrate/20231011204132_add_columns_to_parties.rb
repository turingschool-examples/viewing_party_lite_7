# frozen_string_literal: true

class AddColumnsToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :movie_title, :string
    add_column :parties, :party_date, :datetime
  end
end
