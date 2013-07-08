class php {
  package {
    'php5':
      ensure => present;
  }
  package {
    'php5-fpm':
      ensure => present;
  }
  package {
    'php5-cli':
      ensure => present;
  }
  package {
    'php5-mysql':
      ensure => present;
  }
}