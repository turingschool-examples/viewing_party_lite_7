class AddNullConstraintToUserName < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, false, "default@gmail.com"
    change_column_null :users, :name, false, "default_name"
  end
end
