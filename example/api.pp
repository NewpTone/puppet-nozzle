# api 
$api_auth_host          = '127.0.0.1'
$api_auth_port          = '35357'
$api_auth_protocol      = 'http'
$admin_tenant_name  = 'services'
$admin_user         = 'nozzle'
$admin_password     = 'nozzle'
# haproxy 
$listen                   = '127.0.0.1'
$listen_port_range        = '10000,61000'
$configuration_backup_dir = '/tmp/nozzle'
# default
$api_listen             = '0.0.0.0'
$server_listen          = '0.0.0.0'
$broadcast_listen       = '127.0.0.1'
$feedback_listen        = '127.0.0.1'
$sql_connection         = 'mysql://nova@nova' 
$nova_admin_username	= 'nova' 
$nova_admin_password	= 'nova'
$nova_admin_tenant_name = 'services'
$nova_admin_auth_url    = 'http://localhost:5000/v2.0'
$rabbit_userid          = 'guest'
$rabbit_password        = 'nova'



	class  {'nozzle':
		api_listen             => $api_listen, 
        server_listen          => $server_listen,
        broadcast_listen       => $broadcast_listen,    
        feedback_listen        => $feedback_listen, 
        sql_connection         => $sql_connection,    
        nova_admin_username    => $nova_admin_username,
        nova_admin_password    => $nova_admin_password,
        nova_admin_tenant_name => $nova_admin_tenant_name, 
        nova_admin_auth_url    => $nova_admin_auth_url,
        rabbit_userid          => $rabbit_userid, 
        rabbit_password        => $rabbit_password,
	    listen                   =>  $listen,
	    listen_port_range         =>  $listen_port_range,
	    configuration_backup_dir  =>  $configuration_backup_dir,	
	}

    class {'nozzle::api':
		auth_host          =>  $api_auth_host,
        auth_port          =>  $api_auth_port,
        auth_protocol      =>  $api_auth_protocol,
        admin_tenant_name  =>  $admin_tenant_name,
        admin_user         =>  $admin_user,
        admin_password     =>  $admin_password,
		require			   =>  Class['nozzle']
	}
	
	class {'nozzle::worker':
	}
#	
#	class {

