class  nozzle::mysql(
    $password,
    $dbname = 'nozzle',
    $user   = 'nozzle',
    $host   = 'localhost',
	$sql	= '',
) {
    require 'mysql::python'
    mysql::db { $dbname:                                                          
		user         => $user,                                                      
		password     => $password,                                                  
		host         => $host,                                                      
		charset      => 'utf8',                             
		sql			 => $sql,
	    #require      => Class['mysql::config'],                                    
  }
   file { '/tmp/api-deploy.sh':
		content => template('nozzle/api-deploy.sh.erb'),
		#require	=> File['/tmp/schema.sql']
		}
   file {'/tmp/schema.sql':
		source	=> 'puppet:///modules/nozzle/schema.sql',
		#require   => Database[$dbname]
		}
   exec {'nozzle_db_sync':
		command	=> '/bin/sh /tmp/api-deploy.sh',
		path	=> ['/bin','/usr/bin'],
		#require	=> File['/tmp/api-deploy.sh']
		}
     File['/tmp/api-deploy.sh'] -> File['/tmp/schema.sql'] -> Exec['nozzle_db_sync']
}     
