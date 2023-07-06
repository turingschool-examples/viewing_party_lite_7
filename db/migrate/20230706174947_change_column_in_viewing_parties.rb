class ChangeColumnInViewingParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :viewing_parties, :movie_id
    add_column :viewing_parties, :api_movie_id, :integer
  end
end
