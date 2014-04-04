require 'capistrano_colors'
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

# Load RVM's capistrano plugin.
require 'rvm/capistrano'

require 'capistrano-db-tasks'

set :db_local_clean, true
set :locals_rails_env, "development"

ssh_options[:paranoid] = false
ssh_options[:forward_agent] = true

set :stages, %w(production staging)
set :default_stage, 'production'

# == rvm setting
set :rvm_ruby_string, 'ruby-2.1.0@gart360'
set :rvm_type, :system
# ==

# == bundler setting
set :bundle_flags, "--deployment"
set :bundle_without, [:development, :test]
# ==

set :application, "gart360"
set :deploy_to,   "/var/www/#{application}"
set :repository,  "git@gitlab.gart360.com:gart360/gart360-web.git"

set :scm, :git
set :user, "www-data"

set :use_sudo, false
set :deploy_via, :remote_cache
set :default_run_options, :pty => true


set :deploy_env, 'production'
set :rails_env, 'production'

set :database_yml, "database.yml"
set :current_rev, `git show --format='%H' -s`.chomp

# set :faye_pid, "#{shared_path}/pids/faye.pid"
# set :faye_config, "#{release_path}/faye.ru"

# namespace :faye do
#   desc "Start Faye"
#   task :start do
#     run "cd #{release_path} && bundle exec rackup #{faye_config} -s thin -E production -D -p 6901 --pid #{faye_pid}"
#   end
#   desc "Stop Faye"
#   task :stop do
#     run "kill `cat #{faye_pid}` || true"
#   end
# end
# before 'deploy:update_code', 'faye:stop'
# after 'deploy:finalize_update', 'faye:start'

# == for Unicorn restart
namespace :deploy do
  task :start do ; end
  task :stop do ; end

  task :restart, :roles => [:web], :except => { :no_release => true } do
    run "kill `cat /var/www/gart360/shared/pids/gart360.pid` || true"
    run "kill `cat /var/www/gart360/shared/solr/pids/#{rails_env}/sunspot-solr-#{rails_env}.pid` || true"
  end

  task :reload, :roles => [:web], :except => { :no_release => true } do
    run "kill -HUP `cat /var/www/gart360/shared/pids/gart360.pid` || true"
  end

  task :precompile do
    run "cd #{release_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile"
  end

  task :reindex do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec rake sunspot:solr:reindex"
  end
end
# =

# == add symlink
after "bundle:install", :roles => :web do
  run "ln -s #{shared_path}/config/#{database_yml} #{release_path}/config/database.yml"
  # run "ln -s #{shared_path}/config/settings.yml #{release_path}/config/settings.yml"

  run "ln -sf #{shared_path}/solr/data #{release_path}/solr/data"
  run "ln -sf #{shared_path}/solr/pids #{release_path}/solr/pids"
  # run "cd #{release_path}; RAILS_ENV=staging bundle exec rake db:create --trace"
end

after "bundle:install", "deploy:migrate"

after 'deploy:update', 'deploy:cleanup'

after "deploy:cleanup", "deploy:precompile"