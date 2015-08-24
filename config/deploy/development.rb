set :rails_env, :production
set :scheme, 'http'
server 'api.fantasydrafthub.com', user: 'deploy', roles: %w{web app db}, primary: true