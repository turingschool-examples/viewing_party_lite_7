class ChangePartiesColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :parties, :date, :string
    change_column :parties, :start_time, :string
    add_column :parties, :name, :string
  end
end
