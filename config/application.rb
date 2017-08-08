require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Omnistore
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.load_path += Dir["#{Rails.root.to_s}/config/locales/**/*.{rb,yml}"]
    config.generators.system_tests = nil
    I18n.available_locales = [:en, :vi]
    config.time_zone = "Hanoi"
    config.i18n.default_locale = :vi
    config.to_prepare { Devise::SessionsController.layout "devise" }
  end
end
