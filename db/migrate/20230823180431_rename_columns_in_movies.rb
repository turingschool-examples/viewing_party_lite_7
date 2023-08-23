class RenameColumnsInMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column(:movies, :name, :title)
    rename_column(:movies, :genre, :genre_ids)
    rename_column(:movies, :summary, :overview)
    rename_column(:movies, :total_reviews, :vote_count)
  end
end
