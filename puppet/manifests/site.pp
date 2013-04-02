
node default {
  include base
  include environment
  include ssh_keys
  include maven
  include java
  include zookeeper
  include hadoop
  include accumulo

  Class['base'] -> Class['environment'] -> Class['ssh_keys'] -> Class['java'] -> Class['maven'] -> Class['zookeeper'] -> Class['hadoop'] -> Class['accumulo']
}


class base {
  

  yumrepo { 'cloudera-cdh4':
        descr    => "Cloudera\'s Distribution for Hadoop, Version 4",
        enabled  => $enabled,
        gpgcheck => 0,
        gpgkey   => "http://archive.cloudera.com/cdh4/redhat/${::os_maj_version}/${::architecture}/cdh/RPM-GPG-KEY-cloudera",
        # baseurl  => "http://archive.cloudera.com/cdh4/redhat/${::os_maj_version}/${::architecture}/cdh/4/",
        baseurl  => "http://archive.cloudera.com/cdh4/redhat/6/x86_64/cdh/4/",
        priority => '50',
        protect  => '0',
  }

  File { owner => 0, group => 0, mode => 0644 }
  
  file { '/etc/motd':
     content => "Welcome to your Accumulo Dev Box v0.2!"
  }


}

