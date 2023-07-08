class AddHostToParties < ActiveRecord::Migration[7.0]
  def change
    add_column :parties, :host, :string
  end
end
