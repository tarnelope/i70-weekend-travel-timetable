class SegmentCreator
  attr_accessor :travel_time, :expected_travel_time, :segment_id, :end_mile_marker, :start_mile_marker, :segment_name, :road_name

  def initialize(segment_data)
    travel_time = segment_data["travel_time"]
    expected_travel_time = segment_data["expected_travel_time"]
    segment_id = segment_data["segment_id"]
    end_mile_marker = segment_data["end_mile_marker"]
    start_mile_marker = segment_data["start_mile_marker"]
    segment_name = segment_data["segment_name"]
    road_name = segment_data["road_name"]
  end

  def create
    segment = Segment.new(segment_params)
    fail ArgumentError, segment.errors.full_messages.to_sentence unless segment.save
    segment
  end

  private

  def segment_params
    clean_time_attributes

    {
      travel_time: travel_time,
      expected_travel_time: expected_travel_time,
      segment_id: segment_id,
      end_mile_marker: end_mile_marker,
      start_mile_marker: start_mile_marker,
      segment_name: segment_name,
      road_name: road_name
    }
  end

  def clean_time_attributes
    travel_time = travel_time["Minutes"] if travel_time
    expected_travel_time = expected_travel_time["Minutes"] if expected_travel_time
  end
end
