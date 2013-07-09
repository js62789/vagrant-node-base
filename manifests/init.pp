#puppet essential... 
group { 'puppet': ensure => 'present' }

#global path def.
Exec { path => '/usr/bin:/bin:/usr/sbin:/sbin' }

include stdlib
include apt
include nodejs
include nginx
include php
include mysql
include vim

file { 
  '/etc/nginx/sites-enabled/server.conf':
    ensure => link,
    target => "/var/www/conf/server.conf",
    require => Package['nginx'],
    notify => Service['nginx'],
    force  => true
}