# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, '/path/to/my/cron_log.log'
#
# every 2.hours do
#   command '/usr/bin/some_great_command'
#   runner 'MyModel.some_method'
#   rake 'some:great:rake:task'
# end
#
# every 4.days do
#   runner 'AnotherModel.prune_old_records'
# end

# Learn more: http://github.com/javan/whenever

set :environment, 'development'

# every '*/5 5-10 * * 0,6' do
#   rake 'collect:traffic_snapshot'
# end

# This is just to get some data going
every '*/5 5-10 * * *' do
  rake 'collect:traffic_snapshot'
end

every '*/5 5-10 * * 0,6' do
  rake 'test_task:scheduler'
  command "echo 'you can use raw cron syntax too'"
end
