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

describe command('su - railsapp -c "ruby -v"') do
  its('stdout') { should include 'ruby 2.4' }
end

describe command('su - railsapp -c "rvm version"') do
  its('stdout') { should include 'rvm' }
end
