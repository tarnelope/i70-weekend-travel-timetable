namespace :test_task do
  desc "test that schedule works"
  task scheduler: :environment do
    Rails.logger.info("Scheduler task ran at #{Time.now}")

    puts 'test task running'
  end
end
