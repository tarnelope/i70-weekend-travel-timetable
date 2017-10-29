class TrafficSnapshotSegmentsCreator
  attr_reader :generated_date, :segments

  def initialize(traffic_data)
    @generated_date = traffic_data["Header"]["GeneratedDate"]
    @segments = traffic_data["Segment"]
  end

  def create
    segments = segments_by_road_name("I-70")
    segments.each do |segment|
      SegmentSnapshot.create(segment)
    end
  end

  private

  # def filename
  #   prefix = "data/traffic"
  #   datetime = DateTime.parse(generated_date)
  #
  #   month = datetime.strftime("%b")
  #   day = datetime.strftime("%d")
  #   time = datetime.strftime("%H:%M")
  #   directory_name = "#{prefix}/#{month}/#{day}"
  #   FileUtils.mkdir_p(directory_name) unless File.directory?(directory_name)
  #   "#{directory_name}/#{time}.json"
  # end
  #
  # def create_segment(segment_data)
  #   formatted_segment_data(segment_data)
  # end

  def segments_by_road_name(road_name)
    relevant_segments = segments.select { |segment| segment["RoadName"] == road_name }
    relevant_segments.map do |segment|
      updated_segment = segment.transform_keys { |k| k.underscore }
      formatted_segment_data(updated_segment)
    end
  end

  def formatted_segment_data(raw_data)
    data = raw_data.select { |key| SegmentSnapshot.column_names.include?(key) }
    data["travel_time"] = raw_data["travel_time"]["Minutes"] if raw_data.keys.include?("travel_time")
    data["expected_travel_time"] = raw_data["expected_travel_time"]["Minutes"] if raw_data.keys.include?("expected_travel_time")

    data
  end
end
