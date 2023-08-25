class AddColumnToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :movie_title, :string
    add_column :viewing_parties, :movie_image, :string
  end
end
