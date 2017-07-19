# Make sure user postgres exists
describe user('postgres') do
  it { should exist }
end

# Make sure user 'railsapp' exists
describe command('su - postgres -c "psql -t -c \'\du\' | cut -d \\| -f 1 | grep -qw railsapp"') do
  its('exit_status') { should eq 0 }
end

# Make sure database 'railsapp' is created
describe command('su - postgres -c "psql -lqt | cut -d \| -f 1 | grep -qw railsapp"') do
  its('exit_status') { should eq 0 }
end
