# Configure stages
set :stages, %w(production)
set :default_stage, "production"

# Application code configuration
set :application, 'hubb'
set :scm, :git
set :repo_url, 'git@github.com:bearwhocodes/jordana.git'

# RVM
set :rvm_ruby_string, :local              # use the same ruby as used locally for deployment
set :rvm_autolibs_flag, "read-only"       # more info: rvm help autolibs

# Configure directories to link between deploys
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets public/uploads public/sitemaps}

# Configure files to link between deploys
set :linked_files, %w{config/application.yml}

# Don't display 'debug' information
set :log_level, :info

after "deploy:publishing", "deploy:restart"

namespace :deploy do

  desc "Restart the application altering tmp/restart.txt for mod_rails."
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

end

desc 'Invoke a rake command on the remote server'
task :invoke, [:command] => 'deploy:set_rails_env' do |task, args|
  on primary(:app) do
    within current_path do
      with :rails_env => fetch(:rails_env) do
        rake args[:command]
      end
    end
  end
end