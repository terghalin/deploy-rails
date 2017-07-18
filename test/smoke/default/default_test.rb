# Application group
describe group('railsapp') do
  it { should exist }
end

# Application user
describe user('railsapp') do
  it { should exist }
  its('group') { should eq 'railsapp' }
  its('home') { should eq '/home/railsapp' }
end

# Ensure rvm is installed
describe command('su - railsapp -c "rvm version"') do
  its('stdout') { should include 'rvm' }
end

# Ensure ruby 2.4 installed
describe command('su - railsapp -c "ruby -v"') do
  its('stdout') { should include 'ruby 2.4' }
end

# Check packages
%w(git-core curl libpq-dev zlib1g-dev build-essential imagemagick libffi-dev python-software-properties python-psycopg2).each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

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
