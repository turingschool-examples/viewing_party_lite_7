class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.string :date
      t.string :start_time
      t.references :host, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
