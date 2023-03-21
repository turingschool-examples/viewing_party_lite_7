class CreateViewingPartyUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_party_users do |t|
      t.references :user
      t.references :viewing_party
      t.boolean :host
      t.timestamps
    end
  end
end
