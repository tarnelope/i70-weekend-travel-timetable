require 'rake'
require 'rufus-scheduler'
load File.join( Rails.root, 'lib/tasks/collect/traffic_snapshot.rake')

scheduler = Rufus::Scheduler.new

scheduler.cron '*/5 5-10 * * 0,6 America/Denver' do
  puts 'about to collect traffic data'
  Rake::Task['collect:traffic_snapshot'].invoke
  puts 'took a scan'
end
