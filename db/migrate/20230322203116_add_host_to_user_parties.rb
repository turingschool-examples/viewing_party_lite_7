class AddHostToUserParties < ActiveRecord::Migration[7.0]
  def change
    add_column :user_parties, :host, :boolean
  end
end
