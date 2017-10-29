# create the template Segment that SegmentSnapshot can refer to

namespace :create do
  desc "Create segments from segment snapshots data"
  task :segments_by_time_snapshots, [:date] => :environment do |_, args|
    date = Date.parse(args.date)

    daily_travel_info = daily_travel_info(date)
    segment_snapshots = SegmentSnapshot.where(:created_at => date.beginning_of_day..date.end_of_day)

    grouped_segment_snapshots = segment_snapshots.all.group_by do |snapshot|
      time_created = snapshot.created_at.to_datetime
      time_created.change(sec: 0)
    end

    grouped_segment_snapshots.each do |datetime, grouped_snapshots|
      segment_by_time_snapshot = SegmentByTimeSnapshot.create(time_captured: datetime, daily_travel_info_id: daily_travel_info.id)

      grouped_snapshots.each do |segment_snapshot|
        SegmentTravelTime.create(segment_id: segment_snapshot.segment_id, travel_time: segment_snapshot.travel_time, segment_by_time_snapshot_id: segment_by_time_snapshot.id)
      end
    end
  end

  def daily_travel_info(date)
    info = DailyTravelInfo.find_by_date(date)
    info.blank? ? DailyTravelInfo.create(date: date) : info
  end
end
