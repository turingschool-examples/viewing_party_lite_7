# frozen_string_literal: true

class ChangeViewingPartyDuration < ActiveRecord::Migration[7.0]
  def change
    change_column :viewing_parties, :duration, :integer, using: 'duration::integer'
  end
end
