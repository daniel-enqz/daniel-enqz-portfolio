require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DanielEnqz
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join("app/components")
    config.load_defaults 7.0
    config.exceptions_app = routes
    config.time_zone = "Mexico City"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
