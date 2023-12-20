class AddAccountLevelToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :account_level, :integer, null: false, default: 0
  end
end
