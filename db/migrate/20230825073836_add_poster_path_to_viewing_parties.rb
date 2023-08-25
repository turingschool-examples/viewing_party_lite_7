class AddPosterPathToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :poster_path, :string
  end
end
