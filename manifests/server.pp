class nozzle::server(
    $password,
    $dbname = 'nozzle',
    $user   = 'nozzle',
    $host   = '127.0.0.1',
    $sql    = '', 
) {
	package {'nozzle-server':
        ensure => present,
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
