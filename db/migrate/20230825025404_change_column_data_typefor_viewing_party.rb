class ChangeColumnDataTypeforViewingParty < ActiveRecord::Migration[7.0]
  def change
    change_column :viewing_parties, :start_time, :string
  end
end
