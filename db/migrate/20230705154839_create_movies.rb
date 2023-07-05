class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :summary
      t.string :cast
      t.string :reviews
      t.string :reviewers
      t.integer :rating
      t.integer :runtime

      t.timestamps
    end
  end
end
