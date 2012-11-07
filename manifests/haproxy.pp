class nozzle::haproxy {
    package { 'haproxy':
        ensure => installed,
    }
    # TODO there is problem, when update,it will mv the using haproxy.cfg the original if the server is not installed by puppet before.
	exec {'modify_haprxoy':
		command	=> "mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.orginal",
		path	=> ['/usr/bin/', '/sbin','/bin'],
		onlyif  => ["[ ! -e /etc/haproxy/haproxy.cfg.orginal ]","test -e /etc/haproxy/haproxy.cfg"],
		logoutput   => true,
		require		=> Package['haproxy'],
	}
			
	file {'/etc/haproxy/haproxy.cfg':
		source	=> 'puppet:///modules/nozzle/haproxy.cfg',
		replace =>  false,
		require	=> Package['haproxy'],
		notify	=> Class['nozzle::worker']
}
    
    exec {'set_haproxy_default':
        command =>  "sed -i -e 's/^ENABLED=.*/ENABLED=1/' /etc/default/haproxy",
        path    =>  ['/usr/bin/', '/sbin','/bin'],                
        require =>  Package['haproxy'],
		logoutput   => true,
    }

	
}
