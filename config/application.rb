require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Guo
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.autoload_paths += %W(#{config.root}/lib #{config.root}/lib/extras)
    config.autoload_paths += %W(#{config.root}/app/models/auc)
    config.autoload_paths += %W(#{config.root}/app/models/artist_info)
    config.autoload_paths += %W(#{config.root}/app/models/wx)
    
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run 'rake -D time' for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Beijing'

    config.i18n.locale = config.i18n.default_locale = :'zh-CN'

    config.generators.stylesheets = false
    config.generators.javascripts = false

    I18n.enforce_available_locales = false

    config.middleware.insert_after ActionDispatch::ParamsParser, ActionDispatch::XmlParamsParser

    #壓縮檔案
    config.assets.precompile += %w( application.js )
    config.assets.enabled = false
  end
end