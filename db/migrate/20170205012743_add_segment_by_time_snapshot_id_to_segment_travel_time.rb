class AddSegmentByTimeSnapshotIdToSegmentTravelTime < ActiveRecord::Migration[5.0]
  def change
    add_column :segment_travel_times, :segment_by_time_snapshot_id, :integer
  end
end
