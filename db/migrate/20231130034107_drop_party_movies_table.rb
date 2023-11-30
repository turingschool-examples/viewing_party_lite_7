class DropPartyMoviesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :party_movies
  end
end
