class nozzle(
        $api_listen							= '0.0.0.0',
        $server_listen						= '0.0.0.0',
        $broadcast_listen					= '127.0.0.1',
        $feedback_listen					= '127.0.0.1',
        $sql_connection						= '', 
        $nova_admin_username ,
        $nova_admin_password ,
        $nova_admin_tenant_name				= 'services',
        $nova_admin_auth_url				= 'http://localhost:5000/v2.0',
		$nova_region_name					= 'RegionOne',
		$rabbit_host						= '127.0.0.1',
		$rabbit_port						= '5672',
        $rabbit_userid						= 'guest',
        $rabbit_password					= 'nova',
		$listen								= '127.0.0.1',
		$listen_port_range					= '10000,61000',
		$haproxy_configuration_backup_dir   = '/var/lib/nozzle/backup/haproxy',
		$nginx_configuration_backup_dir     = '/var/lib/nozzle/backup/nginx',
		$tcp_postfixs						= '.elb4.sinasws.com',
		$http_postfixs						= '.elb7.sinasws.com',
){
  include 'concat::setup'

 package {'python-nozzle':
	ensure	=> present,
 }

 group { 'nozzle':
    ensure  => present,
    system  => true,
    require => Package['python-nozzle'],
 }

 user { 'nozzle':
    ensure  => 'present',
    gid     => 'nozzle',
    system  => true,
    require => Package['python-nozzle'],
 }

  file { '/etc/nozzle':
    ensure  => directory,
    owner   => 'nozzle',
    group   => 'nozzle',
    mode    => 0755,
    require => Package['python-nozzle'],
  }

  concat { '/etc/nozzle/nozzle.conf':
    owner   => 'nozzle',
    group   => 'nozzle',
    mode    => '0600',
    require => Package['python-nozzle'],
#    notify  => Service['nozzle-api','nozzle-server'],
  }
# default section
  nozzle::config { 'DEFAULT':
	config => {
        api_listen             => $nozzle::api_listen,
        server_listen          => $server_listen,
        broadcast_listen       => $broadcast_listen,
        feedback_listen        => $feedback_listen,
        sql_connection         => $sql_connection,
        nova_admin_username    => $nova_admin_username,
        nova_admin_password    => $nova_admin_password,
        nova_admin_tenant_name => $nova_admin_tenant_name,
        nova_admin_auth_url    => $nova_admin_auth_url,
		rabbit_host			   => $rabbit_host,
		rabbit_port			   => $rabbit_port,
        rabbit_userid          => $rabbit_userid,
        rabbit_password        => $rabbit_password,
		tcp_postfixs		   => $tcp_postfixs,
		http_postfixs		   => $http_postfixs
		nova_region_name	   => $nova_region_name,
        }, 
        order   => '00', 
	}
  nozzle::config {'nginx':
		order	=> '01',
	}
  nozzle::config { 'haproxy':
	config  =>  {
		'listen'                    =>  $::listen,
		'listen_port_range'         =>  $::listen_port_range,
		'configuration_backup_dir'  =>  $haproxy_configuration_backup_dir,
	},  
	order   => '02',
 }  

}
