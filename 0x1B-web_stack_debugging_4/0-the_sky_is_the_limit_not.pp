# Puppet manifest to optimize Nginx configuration

# Ensure Nginx package is installed
package { 'nginx':
  ensure => installed,
}

# Define Nginx service
service { 'nginx':
  ensure  => 'running',
  enable  => true,
  require => Package['nginx'],
}

# Configure Nginx settings
file { '/etc/nginx/nginx.conf':
  ensure => file,
  source => 'puppet:///modules/nginx/nginx.conf',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  notify => Service['nginx'],
}

# Define Nginx site configuration
file { '/etc/nginx/sites-available/default':
  ensure => file,
  source => 'puppet:///modules/nginx/default',
  owner  => 'root',
  group  => 'root',
  mode   => '0644',
  notify => Service['nginx'],
}

# Create symbolic link to enable the site
file { '/etc/nginx/sites-enabled/default':
  ensure => link,
  target => '/etc/nginx/sites-available/default',
  notify => Service['nginx'],
}

# Reload Nginx configuration after changes
exec { 'reload-nginx':
  command     => '/usr/sbin/nginx -s reload',
  refreshonly => true,
  subscribe   => [File['/etc/nginx/nginx.conf'], File['/etc/nginx/sites-enabled/default']],
}
