class AddMovietoWatchParties < ActiveRecord::Migration[7.0]
  def change
    add_reference :watch_parties, :movie, foreign_key: true
  end
end
