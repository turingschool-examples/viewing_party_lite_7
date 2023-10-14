class AddColumnToPartyGuests < ActiveRecord::Migration[7.0]
  def change
    add_column :party_guests, :host, :boolean
  end
end
