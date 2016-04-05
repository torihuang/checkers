class CreatePlacements < ActiveRecord::Migration
  def change
    create_table :placements do |t|
      t.integer :room_id
      t.integer :item_id
      t.integer :item_location_x
      t.integer :item_location_y

      t.timestamps(null: false)
    end
  end
end
