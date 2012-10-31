$api_auth_host          = '127.0.0.1'
$api_auth_port          = '35357'
$api_auth_protocol      = 'http'
$admin_tenant_name  = 'services'
$admin_user         = 'nozzle'
$admin_password     = 'nozzle'
$listen                   = '127.0.0.1'
$listen_port_range        = '10000,61000'
$configuration_backup_dir = '/tmp/nozzle'


	class  {'nozzle':}

    class {'nozzle::api':
		auth_host          =>  $api_auth_host,
        auth_port          =>  $api_auth_port,
        auth_protocol      =>  $api_auth_protocol,
        admin_tenant_name  =>  $admin_tenant_name,
        admin_user         =>  $admin_user,
        admin_password     =>  $admin_password,
	}
	
#	class {'nozzle:worker':
#		listen						=>  $listen,
#		listen_port_range			=>  $listen_port_range,
#		configuration_backup_dir	=>	$configuration_backup_dir,
#	}
#	
#	class {

