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
    config.sass.preferred_syntax = :sass
    config.sass.line_comments = false
    config.sass.cache = false
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
