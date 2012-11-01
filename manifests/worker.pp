class nozzle::worker
# (
#  $listen                   = '127.0.0.1',
#  $listen_port_range        = '10000,61000',
#  $configuration_backup_dir = '/var/lib/nozzle/backup/haproxy',
#) 
{
	include 'nozzle::haproxy'
	package {'nozzle-worker':
        ensure => present,
   }	
	
#	nozzle::config { 'haproxy':
#		config	=>	{
#			'listen'					=>	$listen,
#			'listen_port_range'			=>  $listen_port_range,
#			'configuration_backup_dir'	=>	$configuration_backup_dir,
#		},
#		order	=> '03',
#	}
}	
