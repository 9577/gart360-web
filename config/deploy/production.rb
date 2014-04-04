servers = ['61.174.8.194']

# set servers
role :web do servers end

set :servers, servers
role :db, :primary => true do servers end

set :rails_env, 'production'
set :branch, 'master'