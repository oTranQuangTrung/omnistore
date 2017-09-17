set :stage, :staging
set :rails_env, :staging
set :deploy_to, "/usr/local/omnistore"
set :repo_url, ENV["REPO_URL"]
set :branch, ENV["REPO_BRANCH"]
server ENV["DEPLOY_SERVER_IP"], user: ENV["DEPLOY_USER"], roles: %w{web app db}
