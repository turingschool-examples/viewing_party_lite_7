# frozen_string_literal: true

class AddStartTimeToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :start_time, :datetime
  end
end
