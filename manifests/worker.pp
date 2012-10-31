class nozzle::worker(
  $listen                   = '127.0.0.1',
  $listen_port_range        = '10000,61000',
  $configuration_backup_dir = '/tmp/nozzle',
) {

 package {'nozzle-worker':
        ensure => present,
 }
# mk conf backup dir for nozzle worker 
 file {'{$configuration_backup_dir}':
        ensure  => directory,
        require => Package['nozzle-worker'],
 }

 file {'/etc/haproxy/haproxy.cfg':
     source => 'puppet:///modules/nozzle/haproxy.cfg',
     require => Package['haproxy'] ,
}

 nozzle_config {
     'haproxy/listen':                      value => $listen,
     'haproxy/listen_port_range':           value => $listen_port_range,
     'haproxy/configuration_backup_dir':    value => $configuration_backup_dir,
 }

}
