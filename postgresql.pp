class { 'postgresql::globals':
  encoding             => 'UTF-8',
  locale               => 'en_US.UTF-8',
  before               => Class['postgresql::server']
}

class { 'postgresql::server':
	ip_mask_allow_all_users => '0.0.0.0/0',
	listen_addresses 	=> '*',
}

postgresql::server::role{'imprt':
	password_hash    => 'AeCs&sPx',
	superuser        =>  true,
	require          =>  [
				Class['postgresql::globals'],
				Class['postgresql::server::service']
			     ]
}

postgresql::server::db { 'impdb':
	user     => 'imprt',
	password => postgresql_password('imprt','AeCs&sPx'),
}

postgresql::server::pg_hba_rule { 'allow application network to access impdb database':
  type               => 'host',
  database           => 'impdb',
  user               => 'imprt',
  address            => '0.0.0.0/0',
  auth_method	     => 'md5',
}
