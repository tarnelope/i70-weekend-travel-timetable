class AverageTravelTimesTable
  attr_accessor :start_segment_id, :end_segment_id

  TIME_INTERVALS = %w[06:00 06:05 06:10 06:15 06:20 06:25 06:30 06:35 06:40 06:45 06:50 06:55 07:00 07:05 07:10 07:15 07:20 07:25 07:30 07:35 07:40 07:45 07:50 07:55 08:00 08:05 08:10 08:15 08:20 08:25 08:30 08:35 08:40 08:45 08:50 08:55 09:00 09:05 09:10 09:15 09:20 09:25 09:30 09:35 09:40 09:45 09:50 09:55 10:00].freeze

  # Calculates the average travel times of a single segment across times
  def initialize(start_segment_id, end_segment_id)
    @start_segment_id = start_segment_id.to_i
    @end_segment_id = end_segment_id.to_i
  end

  def average_travel_time_by_depart_time_table
    average_travel_time_table_by_depart_time = []

    TIME_INTERVALS.each do |depart_time|

      average_travel_time_table_by_depart_time.append(time_record(depart_time))
    end

    average_travel_time_table_by_depart_time
  end

  private

  def relevant_segments(depart_time)
    SegmentSnapshot.where(time_captured: depart_time)
  end

  def average_total_travel_time(depart_time)
    average_total_travel_time = 0
    segments = relevant_segments(depart_time)

    (start_segment_id...end_segment_id).each do |segment_id|
      segment_travel_times = segments.select do |segment|
        segment.segment_id == segment_id
      end.map(&:travel_time).compact

      average_total_travel_time += average_segment_travel_time(segment_travel_times)
    end

    average_total_travel_time
  end

  def average_segment_travel_time(segment_travel_times)
    return 0 if segment_travel_times.empty?
    (segment_travel_times.sum / segment_travel_times.length).round
  end

  def time_record(depart_time)
    travel_time = average_total_travel_time(depart_time)
    arrival = (depart_time.to_time + travel_time.minutes).strftime('%H:%M')

    { departure: depart_time,
      travel_time: travel_time,
      arrival: arrival }
  end
end
