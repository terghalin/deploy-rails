# Create database user with password
execute 'create_database_user' do
  user 'postgres'
  timeout 15
  command "psql -c \"CREATE USER #{node['database']['user']['name']} WITH PASSWORD '#{node['database']['user']['password']}';\""

  not_if "psql -t -c '\\du' | cut -d \\| -f 1 | grep -qw #{node['database']['user']['name']}", :user => 'postgres', :timeout => 15
end

# Create database and assign user as owner
execute 'create_database' do
  user 'postgres'
  timeout 15
  command "psql -c 'CREATE DATABASE #{node['database']['name']} OWNER #{node['database']['user']['name']};'"

  not_if "psql -lqt | cut -d \\| -f 1 | grep -qw #{node['database']['name']}", :user => 'postgres', :timeout => 15
end
