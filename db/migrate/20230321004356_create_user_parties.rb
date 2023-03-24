class CreateUserParties < ActiveRecord::Migration[7.0]
  def change
    create_table :user_parties do |t|
      t.references :user, null: false, foreign_key: true
      t.references :party, null: false, foreign_key: true
      t.integer :invite_status, null: false, default: 0

      t.timestamps
    end
  end
end
