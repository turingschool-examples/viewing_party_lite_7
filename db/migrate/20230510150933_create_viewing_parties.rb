class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.string :title
      t.integer :duration
      t.datetime :datetime
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
