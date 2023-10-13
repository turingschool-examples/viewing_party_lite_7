class AddPosterPathToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :poster_path, :string
  end
end
