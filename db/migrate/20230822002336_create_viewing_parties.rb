class CreateViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.string :date
      t.string :movie_id
      t.timestamps
    end
  end
end
