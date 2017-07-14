# Application group
describe group('railsapp') do
  it { should exist }
end

# Application user
describe user('railsapp') do
  it { should exist }
end
