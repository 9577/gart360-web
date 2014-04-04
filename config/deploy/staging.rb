servers = ['staging.gart360.com']

# set servers
role :web do servers end

set :servers, servers
role :db, :primary => true do servers end

set :rails_env, 'staging'
set :branch, 'staging'