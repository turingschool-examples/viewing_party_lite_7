class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies, id: false do |t|
      t.primary_key :id
      t.string :title
      t.integer :duration
      t.string :poster_path

      t.timestamps
    end
  end
end
