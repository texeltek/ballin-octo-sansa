

class accumulo {


  package { 'wget':
    ensure => installed,
  }


  exec { 'download-accumulo':
    command => '/usr/bin/wget http://mirrors.gigenet.com/apache/accumulo/1.4.3/accumulo-1.4.3-dist.tar.gz -O /tmp/accumulo-1.4.3-dist.tar.gz',
    creates => '/tmp/accumulo-1.4.3-dist.tar.gz',
    before => Exec['extract-accumulo-tar'],
  }


  exec { 'extract-accumulo-tar':
    cwd => '/opt',
    command => '/bin/tar -zxvf /tmp/accumulo-1.4.3-dist.tar.gz',
    creates => '/opt/accumulo-1.4.3',
  }


  file { "/opt/accumulo-1.4.3/conf/accumulo-env.sh" :
    require => [
      Exec["extract-accumulo-tar"],
    ],
    owner => hdfs,
    group => hdfs,
    source  => "puppet:///modules/accumulo/accumulo-env.sh",
    mode => 644,
  }
 
  file { "/opt/accumulo-1.4.3/conf/accumulo-site.xml" :
    require => [
      Exec["extract-accumulo-tar"],
    ],
    owner => hdfs,
    group => hdfs,
    content => template("accumulo/accumulo-site.erb"),
    mode => 644,
  }


  file { "/opt/accumulo-1.4.3/bin/create_gem_tables.sh" :
    require => [
      Exec["extract-accumulo-tar"],
    ],
    owner => hdfs,
    group => hdfs,
    source  => "puppet:///modules/accumulo/create_gem_tables.sh",
    mode => 744,
  }

  # exec { 'initialize-accumulo' :
  #   #path    => "/usr/bin",
  #   command => '/opt/accumulo-1.4.3/bin/accumulo init',
  #   require => File["/opt/accumulo-1.4.3/conf/accumulo-site.xml"],
  # }

  # exec{ 'start-accumulo':
  #   command => '/opt/accumulo-1.4.3/bin/start-all.sh',
  #   require => Exec["initialize-accumulo"],
  #   unless => '/bin/ps -efa | grep accumulo'
  # }

}
