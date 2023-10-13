# frozen_string_literal: true

class AddDurationToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :duration, :integer
  end
end
