class CreateViewingParty < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.string :movie_title
      t.string :host
      t.date :event_date
      t.time :start_time

      t.timestamps
    end
  end
end
