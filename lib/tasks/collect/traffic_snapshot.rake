require 'net/http'

namespace :collect do
  desc 'DEV with environment - Get a snapshot of traffic from CO-Trip'
  task traffic_snapshot_dev: :environment do
    uri = URI('http://www.cotrip.org/speed/getSegments.do')
    response = Net::HTTP.get(uri)
    traffic_data = JSON.parse(response)['SpeedDetails']
    puts 'traffic_snapshot_dev perform'
    CreateTrafficSnapshotJob.perform_now(traffic_data)
  end

  desc 'Get a snapshot of traffic from CO-Trip'
  task traffic_snapshot: :environment do
    puts 'about to collect traffic data'
    uri = URI('http://www.cotrip.org/speed/getSegments.do')
    response = Net::HTTP.get(uri)
    traffic_data = JSON.parse(response)['SpeedDetails']

    CreateTrafficSnapshotJob.perform_now(traffic_data)
  end
end
