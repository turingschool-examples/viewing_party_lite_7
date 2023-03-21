class CreateViewingParty < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration_of_party
      t.date :when
      t.time :start_time

      t.timestamps
    end
  end
end
