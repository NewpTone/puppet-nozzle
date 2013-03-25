class nozzle::api (
        $auth_host          = '127.0.0.1',
        $auth_port          = '35357',
        $auth_protocol      = 'http',
        $admin_tenant_name  = 'services',
        $admin_user         = 'nozzle',
        $admin_password     = 'nova',
) {
    package { 'nozzle-api':
        ensure  =>  'present',
    }
	file { '/etc/nozzle/api-paste.ini':
		content => template('nozzle/api-paste.ini.erb'),
		require	=> Package['nozzle-api']
  }
    file {'/var/cache/nozzle':
        ensure => directory,
        mode   => '0744',
        }
}
