class AddColumnToViewingUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_users, :host, :integer
  end
end
