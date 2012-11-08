class nozzle::keystone::auth (
    $email              = 'nozzle@sws.com',
    $ensure             = present,
    $auth_name		= 'nozzle',
    $password			= 'nozzle',
    $tenant             = 'services',
    $public_address     = '127.0.0.1', 
    $admin_address      = '127.0.0.1', 
    $internal_address   = '127.0.0.1', 
    $loadbalance_port    = '5556',
    $loadbalance_version = 'v1.0',
    $region             = 'RegionOne'
) {

  Keystone_user_role["${auth_name}@services"] ~> Service <| name == 'nozzle-api' |>
  Keystone_user_role["${auth_name}@services"] ~> Service <| name == 'nozzle-server' |>

    keystone_user {$auth_name:
       ensure   => $ensure,
       password => $password,
	   email	=> $email,
    }
    keystone_user_role { "${auth_name}@services":
       ensure  => present,
       roles   => 'admin',
	   require => Keystone_user["$auth_name"]
    }
    keystone_service { $auth_name:
        ensure      => present, 
        type        => 'loadbalance', 
        description => 'Openstack LoadBalance Service',
    } 
    keystone_endpoint { "${region}/${auth_name}": 
        ensure       => present, 
        region       => $region, 
        public_url   => "http://${public_address}:${loadbalance_port}/${loadbalance_version}", 
        admin_url    => "http://${admin_address}:${loadbalance_port}/${loadbalance_version}",
        internal_url => "http://${internal_address}:${loadbalance_port}/${loadbalance_version}",
    }
}     
