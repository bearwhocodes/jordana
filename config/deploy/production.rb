server '139.59.160.219', user: 'deploy', roles: %w{web app db}

set :rvm_ruby_version, '2.4.1'
set :branch, 'master'
set :rails_env, 'production'
set :deploy_to '/var/www/jordana/www'