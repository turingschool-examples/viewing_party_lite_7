class CreateParties < ActiveRecord::Migration[7.0]
  def change
    create_table :parties do |t|
      t.integer :duration
      t.date :date
      t.time :time
			t.string :image_path
			t.string :title
			t.integer :runtime
			
      t.timestamps
    end
  end
end
