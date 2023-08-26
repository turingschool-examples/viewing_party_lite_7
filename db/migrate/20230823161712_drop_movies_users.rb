# frozen_string_literal: true

class DropMoviesUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :movies_users
  end
end
