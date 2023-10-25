class AddImagePathToViewingParties < ActiveRecord::Migration[7.0]
  def change
    add_column :viewing_parties, :image_path, :string
  end
end
