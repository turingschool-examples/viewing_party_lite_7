class AddDefaultToHostInPartyGuests < ActiveRecord::Migration[7.0]
  def change
    change_column :party_guests, :host, :boolean, default: false
  end
end
