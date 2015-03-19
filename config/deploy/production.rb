set :stage, :production

server '192.168.1.96', user: 'deploy', roles: %w{web app}