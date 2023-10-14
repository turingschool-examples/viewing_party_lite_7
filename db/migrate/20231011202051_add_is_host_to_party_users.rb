# frozen_string_literal: true

class AddIsHostToPartyUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :party_users, :is_host, :boolean
  end
end
