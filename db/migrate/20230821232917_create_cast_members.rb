class CreateCastMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :cast_members do |t|
      t.string :name
      t.string :character

      t.timestamps
    end
  end
end
