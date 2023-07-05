class CreateViewingUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_users do |t|
      t.references :User, null: false, foreign_key: true
      t.references :ViewingParty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
