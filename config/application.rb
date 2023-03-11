require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MotoRail
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    # config.hosts << '2a4c-2400-4153-c521-7000-3a3f-ec44-e475-8a6b.jp.ngrok.io'
    # config.web_console.whitelisted_ips = '172.16.1.233', '172.16.1.149'
    # Rails.application.config.assets.paths << Rails.root.join("stylesheets/css")
  end
end
