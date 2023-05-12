class RemoveHostFromParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :parties, :host, :string
  end
end
