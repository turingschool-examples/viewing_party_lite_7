class AddIsHostPartyUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :party_users, :is_host, :boolean, :default => false 
  end
end
