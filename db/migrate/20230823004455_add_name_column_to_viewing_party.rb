class AddNameColumnToViewingParty < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :name, :string
  end
end
