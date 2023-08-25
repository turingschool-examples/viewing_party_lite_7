class ChangeRuntimeDataTypeInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :runtime, :integer, using: 'EXTRACT(EPOCH FROM runtime)::integer'
  end
end
