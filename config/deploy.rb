# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'intranet'
set :repo_url, 'https://github.com/sean-perryman/intranet.git'

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/deploy/intranet'

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
