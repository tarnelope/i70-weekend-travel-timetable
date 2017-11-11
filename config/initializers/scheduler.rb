require 'rake'
require 'rufus-scheduler'
I70TravelCalculator::Application.load_tasks

scheduler = Rufus::Scheduler.new

scheduler.cron '*/5 5-10 * * 0,6 America/Denver' do
  Rake::Task['collect:traffic_snapshot'].invoke
end
