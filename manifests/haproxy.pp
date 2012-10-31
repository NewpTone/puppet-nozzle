class nozzle::haproxy {
    package { 'haproxy':
        ensure => installed,
    }
    
    exec {'set_haproxy_default':
        command =>  "sed -i -e 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy",
        path    =>  ['/usr/bin/', '/sbin','/bin'],                
        require =>  Package['haproxy'],
    }
}
