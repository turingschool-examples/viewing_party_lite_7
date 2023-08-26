# frozen_string_literal: true

class ChangeUserIdsDataTypeInViewingParties < ActiveRecord::Migration[7.0]
  def change
    change_column :viewing_parties, :user_ids, 'integer[] USING ARRAY[user_ids]::integer[]'
  end
end
