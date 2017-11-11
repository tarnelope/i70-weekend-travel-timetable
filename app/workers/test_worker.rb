class TestWorker
  include Sidekiq::Worker

  def perform
    puts 'test worker hi!'
  end
end
