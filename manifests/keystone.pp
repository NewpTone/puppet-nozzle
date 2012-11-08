class nozzle::keystone (
    $email              = 'nozzle@sws.com',
    $enabled            = true,
    $ensure             = present,
#    $id ,
    $name				= 'nozzle',
    $password			= 'nozzle',
    $tenant             = 'services',
    $public_address     = '127.0.0.1',                                                 
    $admin_address      = '127.0.0.1',                                                 
    $internal_address   = '127.0.0.1', 
    $loadbalance_port    = '5556',
    $loadbalance_version = 'v1.0',
    $region             = 'RegionOne',
) {

    keystone_user {$name:
       ensure   => $ensure,
       password => $password,
    }
    keystone_user_role { "${name}@services":
       ensure  => present,                                                         
       roles   => 'admin', 
    }
    keystone_service { $auth_name:                                                   
        ensure      => present,                                                        
        type        => 'loadbalance',                                                                  
        description => "Openstack LoadBalance Service",                                 
    } 
    keystone_endpoint { $auth_name:                                               
        ensure       => present,                                                    
        region       => $region,                                                    
        public_url   => "http://${public_address}:${loadbalance_port}/${loadbalance_version}",  
        admin_url    => "http://${admin_address}:${loadbalance_port}/${loadbalance_version}",
        internal_url => "http://${internal_address}:${loadbalance_port}/${loadbalance_version}",
    }
}     
