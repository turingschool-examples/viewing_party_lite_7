class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.date :day
      t.integer :time
      t.bigint :host_id  # pointing to valid user id

      t.timestamps
    end
  end
end
