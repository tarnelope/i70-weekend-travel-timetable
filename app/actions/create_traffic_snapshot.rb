class CreateTrafficSnapshotJob
  attr_reader :traffic_data

  def initialize(traffic_data)
    self.traffic_data = traffic_data

    process
  end
end
