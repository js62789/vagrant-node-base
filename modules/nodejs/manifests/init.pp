class nodejs {
  apt::ppa { 
    'ppa:chris-lea/node.js':
      before => Anchor['nodejs::repo'];
  }

  # anchor resource provides a consistent dependency for prereq.
  anchor {
    'nodejs::repo':
  }

  package {
    'nodejs':
      ensure => present,
      require => Anchor['nodejs::repo'];
  }
}