class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :movie_id
      t.string :date
      t.string :time
      t.integer :duration
      t.integer :host_id

      t.timestamps
    end
  end
end
