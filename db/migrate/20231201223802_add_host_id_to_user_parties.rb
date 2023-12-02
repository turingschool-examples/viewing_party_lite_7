class AddHostIdToUserParties < ActiveRecord::Migration[7.0]
  def change
    add_column :user_parties, :host_id, :integer
  end
end
