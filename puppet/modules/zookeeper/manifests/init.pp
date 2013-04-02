class zookeeper {

  user { "zookeeper":
    ensure     => present,
    managehome => true,
  }

  package { "zookeeper":
    ensure   => installed,
    require  => Yumrepo["cloudera-cdh4"]
  }

  package { "zookeeper-server":
    ensure => installed,
    require => Package['zookeeper'],
  }
  
  exec { 'initialize-zookeeper' :
    path    => "/sbin",
    command => 'service zookeeper-server init --force',
    creates => '/var/zookeeper/version-2',
    require => Package['zookeeper-server'],
    # notify  => Service['zookeeper-server'],
  }

  file { "/etc/zookeeper/conf/zoo.cfg":
    require => Package["zookeeper-server"],
    owner   => zookeeper,
    group   => zookeeper,
    mode    => 644,
    source  => "puppet:///modules/zookeeper/zoo.cfg",
  }


  file { "/var/zookeeper":
    ensure => "directory",
    owner  => "zookeeper",
    group  => "zookeeper",
    mode   => 750,
  }
  
  service { "zookeeper-server":
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    require    => [
      Exec['initialize-zookeeper'],
      Package['zookeeper-server'],
    ],
  }
  
}

