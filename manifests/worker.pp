class nozzle::worker(
    $password,
    $dbname = 'nozzle',
    $user   = 'nozzle',
    $host   = '127.0.0.1',
    $sql    = '', 
) {
	include 'nozzle::haproxy'
	package {'nozzle-worker':
        ensure  => present,
		require	=> Class['nozzle::mysql']
   }
    class {'nozzle::mysql':
		password	=> $password,
		dbname		=> $dbname,
		user		=> $user,
		host		=> $host,
		sql			=> $sql,
	}		
}
