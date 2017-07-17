# Update repo
apt_update 'update' do
  action :update
end

# Install nginx
package 'install nginx' do
  package_name 'nginx'
end
