default['postgresql']['version'] = '9.5'
default['postgresql']['enable_pgdg_apt'] = true
default['postgresql']['config']['listen_addresses'] = 'localhost'
default['postgresql']['password']['postgres'] = 'railsapp_password'

default['database']['name'] = 'railsapp'
default['database']['user']['name'] = 'railsapp'
default['database']['user']['password'] = 'railsapp_password'
