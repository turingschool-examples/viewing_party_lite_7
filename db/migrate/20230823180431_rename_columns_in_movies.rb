# frozen_string_literal: true

class RenameColumnsInMovies < ActiveRecord::Migration[7.0]
  def change
    rename_column(:movies, :name, :title)
    rename_column(:movies, :summary, :overview)
  end
end
