class RemoveMovieTitleDurationImagePathFromViewingParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :viewing_parties, :movie_title, :string
    remove_column :viewing_parties, :duration, :integer
    remove_column :viewing_parties, :image_path, :string
  end
end
