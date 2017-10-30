namespace :migrate do
  desc 'Add time_captured and date_captured column to segment_snapshot'
  task add_time_captured_to_segment_snapshots: :environment do
    SegmentSnapshot.all.each do |segment_snapshot|
      date_time_captured = segment_snapshot.created_at.round_to(5.minutes)

      segment_snapshot
        .update_attributes(date_captured: date_time_captured.to_date,
                           time_captured: date_time_captured.strftime('%H:%M'))
    end
  end
end
