class AddUsersToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_reference :viewing_parties, :users, null: false, foreign_key: true
  end
end
