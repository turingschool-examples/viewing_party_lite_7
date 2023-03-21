class AddNameToParty < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :name, :string
  end
end
