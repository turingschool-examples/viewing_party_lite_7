class AddDurationToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :duration, :integer
  end
end
