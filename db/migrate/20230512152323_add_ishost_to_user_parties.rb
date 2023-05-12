class AddIshostToUserParties < ActiveRecord::Migration[7.0]
  def change
    add_column :user_parties, :is_host, :boolean, default: false
  end
end
