class  nozzle::mysql(
    $password,
    $dbname = 'nozzle',
    $user   = 'nozzle',
    $host   = '127.0.0.1',
	$sql	= '',
) {
    require 'mysql::python'
    mysql::db { $dbname:                                                          
		user         => $user,                                                      
		password     => $password,                                                  
		host         => $host,                                                      
		charset      => 'utf8',                             
		sql			 => $sql,
	#    require      => Class['mysql::config'],                                     
  }
   file { '/tmp/api-deploy.sh':
		content => template('nozzle/api-deploy.sh.erb'),
		require	=> File['/tmp/schema.sql']
		}
   file {'/tmp/schema.sql':
		source	=> 'puppet:///modules/nozzle/schema.sql',
		require   => Database[$dbname]
		}
   exec {'nozzle_db_sync':
		command	=> 'sh /tmp/api-deploy.sh',
		require	=> File['/tmp/api-deploy.sh']
		}
}     
