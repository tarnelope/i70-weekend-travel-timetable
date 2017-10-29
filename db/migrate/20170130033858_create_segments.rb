class CreateSegments < ActiveRecord::Migration[5.0]
  def change
    create_table :segments do |t|
      t.integer :road_id
      t.integer :speed_limit
      t.string :segment_type
      t.integer :segment_id
      t.float :end_mile_marker
      t.float :length
      t.float :start_mile_marker
      t.string :road_name
      t.string :segment_name

      t.timestamps
    end
  end
end
