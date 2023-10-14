# frozen_string_literal: true

class RemoveUserFromParty < ActiveRecord::Migration[7.0]
  def change
    remove_reference :parties, :user, null: false, foreign_key: true
  end
end
