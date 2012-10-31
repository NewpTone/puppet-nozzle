class nozzle::haproxy {
    package { 'haproxy':
        ensure => installed,
    }

	exec {'modify_haprxoy':
		command	=> "mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.orginal",
		path	=> ['/usr/bin/', '/sbin','/bin'],
		unless	=> "test -e /etc/haproxy/haproxy.cfg.orginal"
	}
			
	file {'/etc/haproxy/haproxy.cfg':
		source	=> 'puppet:///modules/nozzle/haproxy.cfg',
		replace =>  false,
		require	=> Package['haproxy']
}
    
    exec {'set_haproxy_default':
        command =>  "sed -i -e 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy",
        path    =>  ['/usr/bin/', '/sbin','/bin'],                
        require =>  Package['haproxy'],
    }

	
}
