require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoRor
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # 設定應用程式的基礎參考時區，注意不是資料庫。
    # see: https://api.rubyonrails.org/classes/ActiveSupport/TimeZone.html
    config.time_zone = 'Taipei'
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
