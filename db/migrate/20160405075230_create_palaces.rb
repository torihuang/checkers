class CreatePalaces < ActiveRecord::Migration
  def change
    create_table :palaces do |t|
      t.string  :name
      t.integer :creator_id
      t.integer :room_id

      t.timestamps(null: false)
    end
  end
end
