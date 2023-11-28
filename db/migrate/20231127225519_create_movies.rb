class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :duration
      t.string :genre
      t.float :vote
      t.string :summary
      t.string :cast  # , array: true
      t.string :reviews  # , array: true

      t.timestamps
    end
  end
end
