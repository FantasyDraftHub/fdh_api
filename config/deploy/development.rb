set :rails_env, :production
set :scheme, 'http'
server 'fantasydrafthub.com', user: 'deploy', roles: %w{web app db}, primary: true
