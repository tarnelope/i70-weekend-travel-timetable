class AverageTravelTimesCalculator
  attr_accessor :segment_id, :average_travel_times

  # Calculates the average travel times of a single segment across times
  def initialize(segment_id)
    @segment_id = segment_id
    @average_travel_times = Hash.new
  end

  def average_travel_times_by_time_capture
    grouped_segment_travel_times = segment_travel_times.group_by(&:time_captured)

    grouped_segment_travel_times.each do |time_captured, segments|
      average_travel_time = 0
      segments.each do |segment|
        average_travel_time += segment.travel_time
      end
      average_travel_time = average_travel_time / segments.length
      average_travel_times[time_captured] = average_travel_time
    end

    Hash[average_travel_times.sort]
  end

  private

  def segment_travel_times
    @_segment_travel_times = SegmentTravelTime.where(segment_id: segment_id)
  end
end
