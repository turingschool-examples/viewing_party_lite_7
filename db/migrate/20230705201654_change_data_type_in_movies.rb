class ChangeDataTypeInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :summary, :text
    change_column :movies, :reviews, :text
  end
end
