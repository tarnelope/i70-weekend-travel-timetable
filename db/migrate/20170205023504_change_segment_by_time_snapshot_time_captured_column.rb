class ChangeSegmentByTimeSnapshotTimeCapturedColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :segment_by_time_snapshots, :time_captured, :datetime
  end
end
