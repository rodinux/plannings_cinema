# This file is used by Rack-based servers to start the application.

# require_relative 'config/environment'
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    if forked
      # We're in smart spawning mode.
      reestablish_connection_to_memcached
    else
      # We're in direct spawning mode. We don't need to do anything.
    end
  end
end
