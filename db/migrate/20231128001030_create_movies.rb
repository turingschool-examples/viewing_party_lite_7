class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.float :vote_average
      t.integer :runtime
      t.string :genre
      t.string :description
      t.string :cast_members
      t.string :review_count
      t.string :review_info

      t.timestamps
    end
  end
end
