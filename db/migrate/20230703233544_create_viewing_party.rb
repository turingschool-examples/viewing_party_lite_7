class CreateViewingParty < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.integer :duration
      t.date :date
      t.time :time
      t.string :movie_title

      t.timestamps
    end
  end
end
