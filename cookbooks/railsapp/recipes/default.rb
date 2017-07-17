# Install required packages
package %w(postgresql postgresql-contrib git-core curl libpq-dev zlib1g-dev build-essential imagemagick libffi-dev python-software-properties python-psycopg2) do
  action :install
end
