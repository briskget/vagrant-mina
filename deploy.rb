
# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.

set :domain, '127.0.0.1'
set :user, 'vagrant'
set :port, `vagrant ssh-config | grep Port | awk '{print $2}'`.chomp
set :identity_file, `vagrant ssh-config | grep IdentityFile | awk '{print $2}'`.chomp

set :deploy_to, '/tmp/mina_test'

set :forward_agent, true     # SSH forward_agent.

task :deploy do
  queue! %[echo "this is a test"]
end
