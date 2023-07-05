class CreateMovieWatchParties < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_watch_parties do |t|
      t.references :watch_party, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :user_status

      t.timestamps
    end
  end
end
