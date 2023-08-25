class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :parties, :movie_title, :movie_id
    change_column :parties, :movie_id, :integer, using: 'movie_id::integer'
  end
end
