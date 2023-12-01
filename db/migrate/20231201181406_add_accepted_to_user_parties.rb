class AddAcceptedToUserParties < ActiveRecord::Migration[7.0]
  def change
    add_column :user_parties, :accepted, :boolean, default: false, null: false
  end
end
