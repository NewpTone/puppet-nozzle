class nozzle::worker{
	include 'nozzle::haproxy'
	package {'nozzle-worker':
        ensure  => present,
   }
}
