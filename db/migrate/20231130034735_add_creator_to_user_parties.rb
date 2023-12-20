class AddCreatorToUserParties < ActiveRecord::Migration[7.0]
  def change
    add_column :user_parties, :creator, :boolean
  end
end
