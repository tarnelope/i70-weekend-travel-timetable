class CreateTrafficSnapshotJob < ActiveJob::Base
  queue_as :default

  def perform(traffic_data)
    day_of_the_week = Time.now.wday
    return if (1..5).cover?(day_of_the_week)

    Processor.new(traffic_data).process
  end

  class Processor
    attr_reader :traffic_data

    def initialize(traffic_data)
      @traffic_data = traffic_data
    end

    def process
      puts 'Create Traffic SnapshotJob about process'
      ::TrafficSnapshotSegmentsCreator.new(traffic_data).create
    end
  end
end
