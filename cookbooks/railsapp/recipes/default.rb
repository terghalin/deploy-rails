# Install required packages
package %w(git-core curl libpq-dev zlib1g-dev build-essential imagemagick libffi-dev python-software-properties python-psycopg2) do
  action :install
end

# TODO: decouple for another role
include_recipe 'railsapp::database'
include_recipe 'railsapp::puma'
