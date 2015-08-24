# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'api'
set :repo_url, 'git@github.com:TradingCardScanner/fdh_api.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, ENV.fetch('DEPLOY_BRANCH', 'master')

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/var/www/api'

set :rails_env, 'production'
set :assets_roles, []
set :sidekiq_role, :sidekiq
set :sidekiq_processes, 2

namespace :deploy do
  task :setup_shared_dirs do
    on release_roles :all do
      within fetch(:deploy_to) do
        execute :mkdir, '-p', 'shared/tmp/pids'
        execute :mkdir, '-p', 'shared/log'
      end
    end
  end
  before :'deploy:setup_shared_dirs'

  task :current do
    on release_roles(:web) do
      within fetch(:deploy_to) do
        sha = capture :cat, 'current/REVISION'
        puts "Current Ref: #{sha}"
      end
    end
  end
end

require 'httparty'
namespace :unicorn do
  task :restart do
    on release_roles :web do |host|
      if test :pgrep, '-lfa', '"unicorn master"'
        execute :pkill, '-HUP', '-f', '"unicorn master"'
        sleep 5
        # Warm up the new unicorns
        puts HTTParty.get("#{fetch(:scheme)}://#{host.hostname}")['ref']
        puts HTTParty.get("#{fetch(:scheme)}://#{host.hostname}")['ref']
      else
        within "#{fetch(:deploy_to)}/current" do
          execute :bundle, 'exec', 'unicorn', '-c config/unicorn.rb', "-E #{fetch(:rails_env)}", '-D'
        end
      end
    end
  end
end

after 'deploy:published', 'unicorn:restart'

namespace :rails do
  namespace :logs do
    task :tail do
      on release_roles(:web) do
        within fetch(:deploy_to) do
          execute :tail, '-f', 'shared/log/unicorn.log'
        end
      end
    end
  end
  task :c do
    server = release_roles(:web, primary: true).first
    port = fetch(:port, 22)
    exec "ssh -l #{fetch(:user, 'deploy')} -p #{port} -t #{server} 'cd #{fetch(:deploy_to)}/current && bin/rails c #{fetch(:rails_env)}'"
  end

  namespace :seed do
    task :all_dev do
      on primary(:db) do
        execute :rake, :'db:truncate', :'db:migrate'
      end
    end
  end
end