class ChangeMovieCastToCastMember < ActiveRecord::Migration[7.0]
  def change
    rename_table :movie_casts, :cast_members
  end
end
