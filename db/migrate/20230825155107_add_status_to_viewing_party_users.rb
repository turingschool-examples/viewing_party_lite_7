class AddStatusToViewingPartyUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_party_users, :status, :integer, default: 0
  end
end
