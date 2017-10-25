server '139.59.160.219', user: 'deploy', roles: %w{web app db}

set :branch, 'master'
set :rails_env, 'production'
set :deploy_to, '/var/www/jordana/www'