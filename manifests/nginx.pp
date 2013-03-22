class nozzle::nginx {
    package { 'nginx':
        ensure => installed,
    }
    file {'/etc/nginx/conf.d/nozzle-log-format.conf':
        ensure   => present,
        source   => 'puppet:///modules/nozzle/nozzle-log-format.conf',
        require  => Package['nginx'],
         }
    }
