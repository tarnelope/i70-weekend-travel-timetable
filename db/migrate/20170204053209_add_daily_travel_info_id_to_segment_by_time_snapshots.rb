class AddDailyTravelInfoIdToSegmentByTimeSnapshots < ActiveRecord::Migration[5.0]
  def change
    add_column :segment_by_time_snapshots, :daily_travel_info_id, :integer
  end
end
