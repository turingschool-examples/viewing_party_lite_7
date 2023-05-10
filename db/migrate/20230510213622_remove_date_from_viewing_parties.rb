class RemoveDateFromViewingParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :viewing_parties, :date, :string
  end
end
