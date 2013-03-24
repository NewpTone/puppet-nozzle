class nozzle::worker{
	include 'nozzle::haproxy'
	include 'nozzle::nginx'
	package {'nozzle-worker':
        ensure  => present,
   }
}
