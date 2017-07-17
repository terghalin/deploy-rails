name 'development'
description 'Development Environment'
cookbook_versions({
    "nginx" => "~> 0.1.0",
    "apt" => "~> 0.1.0"
})
override_attributes ({
    "nginx" => {
        "listen" => [ "80", "443" ]
    },
    "postgresql" => {
        "root_pass" => "root"
    }
})
