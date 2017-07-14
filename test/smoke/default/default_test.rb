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

# Check if GPG-key import working
describe command('gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
') do
  its('exit_status') { should eq 0 }
end
