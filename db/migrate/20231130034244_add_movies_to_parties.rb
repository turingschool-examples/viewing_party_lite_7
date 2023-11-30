class AddMoviesToParties < ActiveRecord::Migration[7.0]
  def change
    add_reference :parties, :movie, index: true
  end
end
