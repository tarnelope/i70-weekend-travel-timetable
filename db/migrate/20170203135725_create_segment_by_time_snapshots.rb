class CreateSegmentByTimeSnapshots < ActiveRecord::Migration[5.0]
  def change
    create_table :segment_by_time_snapshots do |t|
      t.time :time_captured

      t.timestamps
    end

    add_index :segment_by_time_snapshots, :daily_travel_info_id
  end
end
