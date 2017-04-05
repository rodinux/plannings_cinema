#require_relative 'boot'
require File.expand_path('../boot', __FILE__)
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlanningsCinema
  class Application < Rails::Application
  	config.autoload_paths += %W(#{config.root}/lib)
  	config.eager_load_paths += %W(#{config.root}/lib)
    config.assets.paths << Rails.root.join('vendor', 'assets', "*")
    config.assets.precompile += ['rails_admin/rails_admin.css', 'rails_admin/rails_admin.js','pdf.css', 'pdf.js', 'scroll.js']
  	config.time_zone = 'Paris'
  	config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
  	config.i18n.default_locale = :fr
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
