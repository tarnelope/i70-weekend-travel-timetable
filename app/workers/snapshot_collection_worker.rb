require 'net/http'

class SnapshotCollectionWorker
  include Sidekiq::Worker

  def perform
    uri = URI('http://www.cotrip.org/speed/getSegments.do')
    response = Net::HTTP.get(uri)
    traffic_data = JSON.parse(response)['SpeedDetails']
    puts 'traffic_snapshot_dev perform'
    CreateTrafficSnapshotJob.perform_now(traffic_data)
  end
end
