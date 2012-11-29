$user = 'nozzle'
$host = 'localhost'
$dbname = 'nozzle'
$password = 'nozzle'

class {'nozzle::worker':
	user  => $user,
	host  => $host,
	dbname => $dbname,
	password => $password,
}
	
