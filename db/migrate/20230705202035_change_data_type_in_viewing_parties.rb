class ChangeDataTypeInViewingParties < ActiveRecord::Migration[7.0]
  def change
    remove_column :viewing_parties, :when
    remove_column :viewing_parties, :start_time
    add_column :viewing_parties, :date_time, :datetime
  end
end
