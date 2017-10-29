class CreateSegmentTravelTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :segment_travel_times do |t|
      t.integer :segment_id
      t.float :travel_time

      t.timestamps
    end

    add_index :segment_travel_times, :segment_by_time_snapshot_id
  end
end
