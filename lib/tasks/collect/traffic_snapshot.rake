require 'net/http'

namespace :collect do
  desc "Get a snapshot of traffic from CO-Trip"
  task :traffic_snapshot do
    uri = URI('http://www.cotrip.org/speed/getSegments.do')
    response = Net::HTTP.get(uri)
    traffic_data = JSON.parse(response)["SpeedDetails"]
    CreateTrafficSnapshotJob.perform_now(traffic_data)
  end
end
