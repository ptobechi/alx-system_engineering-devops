# Puppet Manifest to Kill a Process
exec { 'killmenow':
  command     => 'pkill -f "killmenow"',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
  onlyif      => 'pgrep -f "killmenow"',
  notify      => Exec['process_result'],
}

exec { 'process_result':
  command     => 'echo OK',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
}

