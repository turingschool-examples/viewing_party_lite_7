class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :overview
      t.float :vote_average
      t.integer :runtime

      t.timestamps
    end
  end
end
