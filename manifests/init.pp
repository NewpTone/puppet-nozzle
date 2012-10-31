class nozzle {
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


}
