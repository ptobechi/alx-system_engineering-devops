# Puppet Manifest to Install Flask with Dependencies
package { 'python3-pip':
  ensure => 'installed',
}

package { 'libffi-dev':
  ensure => 'installed',
  # Add other dependencies if needed
}

exec { 'install_flask_dependencies':
  command => '/usr/bin/pip3 install Werkzeug==2.1.1',
  path    => ['/usr/bin'],
  require => [Package['python3-pip'], Package['libffi-dev']],
}

exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  path    => ['/usr/bin'],
  creates => '/usr/local/lib/python3.x/dist-packages/Flask',
  require => Exec['install_flask_dependencies'],
}

