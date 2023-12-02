class AddColumnsToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :movie_title, :string
    add_column :parties, :image_path, :string
  end
end
