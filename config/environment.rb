# Load the Rails application.
#require_relative 'application'
ENV['RAILS_ENV'] ||= 'production'
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
