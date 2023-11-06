# frozen_string_literal: true

class AddIsHostToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :is_host, :boolean, default: false, null: false
  end
end
