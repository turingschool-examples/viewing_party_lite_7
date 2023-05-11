class ChangePartyHost < ActiveRecord::Migration[7.0]
  def change
    remove_column :parties, :host_user_id
    add_column :partygoers, :host, :boolean, default: false
  end
end
