class CreateMovieCasts < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_casts do |t|
      t.string :name
      t.string :character

      t.timestamps
    end
  end
end
