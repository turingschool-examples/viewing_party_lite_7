# frozen_string_literal: true

class RemoveHostIdFromParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :parties, :host_id
  end
end
