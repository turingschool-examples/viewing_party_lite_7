# frozen_string_literal: true

class CreateUsersViewingParty < ActiveRecord::Migration[7.0]
  def change
    create_table :users_viewing_parties do |t|
      t.references :user, null: false, foreign_key: true
      t.references :viewing_party, null: false, foreign_key: true
      t.boolean :hosting?, null: false, default: false

      t.timestamps
    end
  end
end
