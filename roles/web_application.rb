name "web_application"
description "Web Application Role"
run_list "recipe[rvm::default]", "recipe[nginx::default]"
env_run_lists "production"  => ["recipe[nginx::config_prod]"],
              "development" => ["recipe[nginx::config_dev]"],
              "testing"     => ["recipe[nginx::config_test]"]

default_attributes "nginx" => { "log_location" => "/var/log/nginx.log" }
override_attributes "nginx" => { "gzip" => "on" }
