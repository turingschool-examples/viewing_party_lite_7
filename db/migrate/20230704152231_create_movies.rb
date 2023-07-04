class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :duration
      t.integer :rating
      t.string :genre
      t.string :summary
      t.string :cast

      t.timestamps
    end
  end
end
