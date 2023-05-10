class AddEventDatetimeToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :event_datetime, :datetime
  end
end
