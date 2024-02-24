# Puppet Manifest to Kill a Process
exec { 'killmenow':
  command     => 'pkill -f killmenow',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
  notify      => Exec['check_process'],
}

exec { 'check_process':
  command     => 'pgrep -f killmenow',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
  onlyif      => 'test "$(pgrep -f killmenow)" != ""',
  notify      => Exec['process_result'],
}

exec { 'process_result':
  command     => 'echo OK',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
}

