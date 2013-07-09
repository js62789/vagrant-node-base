class mysql {
  package { 
    'mysql-server':
      ensure => present;
  }
 
  service { 
    'mysql':
      ensure => running,
      enable => true,
      hasstatus => true,
      hasrestart => true,
      require => Package["mysql-server"];
  }
 
  exec { 
    'set-mysql-password':
      unless  => "mysql -uroot -proot",
      path    => ["/bin", "/usr/bin"],
      command => "mysqladmin -uroot password root",
      require => Service["mysql"];
  }
}