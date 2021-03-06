# Install required packages
package %w(git-core bzip2 curl libpq-dev zlib1g-dev build-essential imagemagick libffi-dev python-software-properties python-psycopg2) do
  action :install
end


# Create user and group
include_recipe 'rvm::user'

# Add GPG key
execute "Adding gpg key to #{node['user']['name']}" do

  user node['user']['name']
  group node['group']

 environment ({"HOME" => "/home/#{node['user']['name']}"})
  command "`which gpg2 || which gpg` --keyserver hkp://keys.gnupg.net --recv-keys #{node['rvm']['gpg_key']};"

  not_if { node['rvm']['gpg_key'].empty? }
end

# install rvm
bash 'install rvm' do
  user node['user']['name']
  group node['group']
  cwd "/home/#{node['user']['name']}"
  environment ({"HOME" => "/home/#{node['user']['name']}"})

  code <<-EOH
    export HOME=/home/#{node['user']['name']}
    curl -L get.rvm.io | bash -s stable
    source /home/#{node['user']['name']}/.rvm/scripts/rvm
    rvm autolibs disable
    rvm requirements
  EOH

  not_if { File.exists?("/home/#{node['user']['name']}/.rvm/scripts/rvm") }
end

# install ruby
version_path = "/home/#{node['user']['name']}/.rvm/rubies/" + "ruby-" + node['ruby']['version']

bash 'install ruby and set default version of ruby' do
  user node['user']['name']
  group node['group']
  cwd "/home/#{node['user']['name']}"
  environment ({"HOME" => "/home/#{node['user']['name']}"})

  code <<-EOH
    export HOME=/home/#{node['user']['name']}
    source /home/#{node['user']['name']}/.rvm/scripts/rvm
    rvm install #{node['ruby']['version']}
    rvm use #{node['ruby']['version']} --default
  EOH

  not_if { File.exists?(version_path) }
end
