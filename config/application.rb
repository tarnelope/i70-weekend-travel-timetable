require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module I70TravelCalculator
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    if Rails.env.development? || Rails.env.test?
      config.autoload_paths << "#{config.root}/lib"
      config.autoload_paths << "#{config.root}/services"
    else
      config.eager_load_paths << "#{Rails.root}/lib"
      config.eager_load_paths << "#{Rails.root}/app/services"
    end

    config.active_job.queue_adapter = :sidekiq
  end
end
