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