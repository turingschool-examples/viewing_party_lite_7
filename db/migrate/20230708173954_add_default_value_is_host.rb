class AddDefaultValueIsHost < ActiveRecord::Migration[7.0]
  def change
    change_column :user_parties, :is_host, :boolean, default: false
  end
end
