require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module PF
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # simple_calendarの週初めの設定
    config.beginning_of_week = :sunday

    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja
    #  i18nの複数ロケールファイルが読み込まれるようpathを通す
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #

    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :local

    # config.eager_load_paths << Rails.root.join("extras")

    config.generators do |g|
      # 色々な記述があるので、一番下に追記する
      g.test_framework :rspec,
                      fixtures: true,
                      view_specs: false,
                      helper_specs: false,
                      routing_specs: false,
                      controller_specs: true,
                      request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
