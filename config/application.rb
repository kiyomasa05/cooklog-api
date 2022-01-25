require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cooklog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.generators do |g|
      #g.assets false          # CSS, JavaScriptファイルは生成しない
      g.test_framework :rspec,
                       controller_specs: false,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false
    end
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    # config.api_only = false
    # Added middleware manually.
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore
    config.middleware.use ActionDispatch::ContentSecurityPolicy::Middleware
    #doc:追記 https://qiita.com/Y_uuu/items/1651b181f06499c5cede#cookie%E3%81%AEsamesite%E5%B1%9E%E6%80%A7%E3%82%92none-secure%E5%B1%9E%E6%80%A7%E3%82%92true%E3%81%AB%E3%81%99%E3%82%8B
    config.action_dispatch.cookies_same_site_protection = :none
    config.time_zone = "Tokyo"
    # config.x.cors_allowed_origins=ENV.fetch('CORS_ALLOWED_ORIGINS','http://localhost3001')
    config.autoloader = :classic
    config.hosts << ENV["API_DOMAIN"]
    config.hosts << "cooklog-api.herokuapp.com"
  end
end
