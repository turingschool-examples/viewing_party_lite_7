class AddMoviesToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_reference :viewing_parties, :movies, null: false, foreign_key: true
  end
end
