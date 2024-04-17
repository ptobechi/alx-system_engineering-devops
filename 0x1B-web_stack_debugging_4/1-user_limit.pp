# user_limit.pp

# Set limits for the holberton user
user { 'holberton':
  ensure => 'present',
  managehome => true,
}

# Define ulimit settings for the holberton user
file { '/etc/security/limits.d/holberton.conf':
  ensure  => 'present',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => "holberton hard nofile 65535\nholberton soft nofile 65535\n",
}
