# frozen_string_literal: true

class AddHostUserIdToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :host_user_id, :integer
  end
end
