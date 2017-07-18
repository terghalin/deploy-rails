# Create Puma init file
template '/etc/init.d/puma' do
  source 'puma_init_script.sh.erb'
  owner node['user']['name']
  group node['group']
  mode '0755'

  not_if
end

# Update Puma init defaults
execute 'update_puma_defaults' do
  user 'root'
  command 'update-rc.d -f puma defaults'
end
