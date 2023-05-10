class RemoveStartFromViewingParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :viewing_parties, :start, :string
  end
end
