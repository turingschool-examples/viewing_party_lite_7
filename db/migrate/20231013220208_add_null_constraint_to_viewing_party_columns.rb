class AddNullConstraintToViewingPartyColumns < ActiveRecord::Migration[7.0]
  def change
    change_column_null :viewing_parties, :duration, false
    change_column_null :viewing_parties, :start_time, false
    change_column_null :viewing_parties, :date, false
    change_column_null :viewing_parties, :movie_id, false
    change_column_null :viewing_parties, :host_user_id, false
  end
end
