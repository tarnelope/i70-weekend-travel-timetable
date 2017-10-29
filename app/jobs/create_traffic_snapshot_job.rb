class CreateTrafficSnapshotJob < ApplicationJob
  queue_as :default

  def perform(traffic_data)
    Processor.new(traffic_data).process
  end

  class Processor
    attr_reader :traffic_data
    def initialize(traffic_data)
      @traffic_data = traffic_data
    end

    def process
      ::TrafficSnapshotSegmentsCreator.new(traffic_data).create
    end
  end
end
