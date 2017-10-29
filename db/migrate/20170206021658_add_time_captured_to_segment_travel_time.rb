class AddTimeCapturedToSegmentTravelTime < ActiveRecord::Migration[5.0]
  def change
    add_column :segment_travel_times, :time_captured, :datetime
  end
end
