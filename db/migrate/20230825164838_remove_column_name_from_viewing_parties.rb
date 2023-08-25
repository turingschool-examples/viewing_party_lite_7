class RemoveColumnNameFromViewingParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :viewing_parties, :name
  end
end
