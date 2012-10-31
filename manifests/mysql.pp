class  nozzle::mysql(
    $password,
    $dbname = 'nozzle',
    $user   = 'nozzle',
    $host   = '127.0.0.1',
	$sql,
) {
    require 'mysql::python'

    mysql::db { $dbname:                                                          
    user         => $user,                                                      
    password     => $password,                                                  
    host         => $host,                                                      
    charset      => 'utf8',                             
	sql			 => $sql,
    require      => Class['mysql::config'],                                     
  }
}     
