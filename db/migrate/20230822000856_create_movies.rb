class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :user_score
      t.integer :runtime
      t.string :genre
      t.string :description
      t.string :cast
      t.integer :review_count
      t.string :review
      t.string :reviewer

      t.timestamps
    end
  end
end
