class nozzle::api (
        $auth_host          = '127.0.0.1',
        $auth_port          = '35357',
        $auth_protocol      = 'http',
        $admin_tenant_name  = 'service',
        $admin_user         = 'nozzle',
        $admin_password     = 'nova',
) {
    package { 'nozzle-api':
        ensure  =>  'present',
    }

    nozzle_config {
        'filter:authtoken/auth_host':           value => $auth_host;
        'filter:authtoken/auth_port':           value => $auth_port;
        'filter:authtoken/auth_protocol':       value => $auth_protocol;
        'filter:authtoken/admin_tenant_name':   value => $admin_tenant_name;
        'filter:authtoken/admin_user':          value => $admin_user;
        'filter:authtoken/admin_password':      value => $admin_password;

	}	
}
