namespace :migrate do
  desc "Add time_captured column to segment_travel_time"
  task add_time_captured_to_segment_travel_time: :environment do
    SegmentTravelTime.all.each do |segment_travel_time|
      time_captured = segment_travel_time.segment_by_time_snapshot.time_captured
      segment_travel_time.update_attributes(time_captured: time_captured)
    end
  end
end
