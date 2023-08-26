# frozen_string_literal: true

class RenameUsersToUserIdsInViewingParties < ActiveRecord::Migration[7.0]
  def change
    rename_column :viewing_parties, :users, :user_ids
  end
end
