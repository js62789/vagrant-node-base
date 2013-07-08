class nginx {
  apt::ppa {
    'ppa:nginx/stable':
      before => Anchor['nginx::repo'];
  }

  # anchor resource provides a consistent dependency for prereq.
  anchor {
    'nginx::repo':
  }

  package {
    'nginx':
      ensure => present,
      require => Anchor['nginx::repo'];
  }

  service {
    'nginx':
      ensure => running,
      require => Package['nginx'];
  }

  file { 
    '/var/www':
      ensure => link,
      target => "/vagrant",
      notify => Service['nginx'],
      force  => true
  }

  file { 
    '/etc/nginx/sites-enabled/default':
      ensure => absent,
  }

  file { 
    '/etc/nginx/nginx.conf':
      ensure  => file,
      content => template('nginx/nginx.conf.erb'),
  }
}