require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module PlanningsCinema
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.0

    config.autoload_paths += %W(#{config.root}/lib)
    config.eager_load_paths += %W(#{config.root}/lib)
    config.assets.paths << Rails.root.join('vendor', 'assets', "*")
    config.assets.precompile += ['rails_admin/rails_admin.css', 'rails_admin/rails_admin.js','pdf.css', 'pdf.js', 'scroll.js']
    config.time_zone = 'Paris'
    config.beginning_of_week = :wednesday
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :fr
    #config.action_dispatch.default_headers = { 'X-Frame-Options' => 'ALLOWALL'}

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
