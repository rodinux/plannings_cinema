# config valid for current version and patch releases of Capistrano
#lock "~> 3.10.0"

set :application, "plannings_cinema/code"
set :repo_url, "https://github.com/rodinux/plannings_cinema.git"

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/plannings_cinema/code"

# Default value for :format is :airbrussh.
set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true
#set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
#set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
set :default_env, { path: "/home/deploy/.rvm/bin/rvm:$PATH" }
set :rvm_ruby_version, '2.3.5'

#set :passenger_in_gemfile true

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
 set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :deploy do
	# Create data base first deploy
    desc 'Runs rake db:create'
    task :create => [:set_rails_env] do
      on primary fetch(:migration_role) do
        within release_path do
          with rails_env: fetch(:rails_env) do
            execute :rake, "db:create RAILS_ENV=#{fetch(:rails_env)}"
          end
        end
      end
    end
  end

  # restart passenger
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute 'passenger-config restart-app'
    end
  end

  before 'deploy:migrate', 'deploy:db:create'
  after :deploy, "deploy:migrate"
  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'


# config/deploy/production.rb

set :stage, :production
set :branch, "master"
set :deploy_to, '/var/www/plannings_cinema/code'

server '', user: 'plannings_cinema', roles: %w{web app db}


  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
       within release_path do
        execute :rake, 'cache:clear'
       end
    end
  end

