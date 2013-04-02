class hadoop {


  # user { "hdfs":
  #   ensure     => present,
  #   managehome => true,
  # }

  # user { "hadoop":
  #   ensure     => present,
  #   managehome => true,
  # }

  ############
  # Packages #
  ############
  exec { 'download-hadoop':
    command => '/usr/bin/wget http://www.poolsaboveground.com/apache/hadoop/common/stable/hadoop-1.0.4-bin.tar.gz -O /tmp/hadoop-1.0.4-bin.tar.gz',
    creates => '/tmp/hadoop-1.0.4-bin.tar.gz',
    before  => Exec['extract-hadoop-tar'],
  }


  exec { 'extract-hadoop-tar':
    cwd => '/opt',
    command => '/bin/tar -zxvf /tmp/hadoop-1.0.4-bin.tar.gz',
    creates => '/opt/hadoop-1.0.4',
  }


  #########
  # FILES #
  #########
  file { "/opt/hadoop-1.0.4/conf/hadoop-env.sh" :
    require => [
      Exec["extract-hadoop-tar"],
    ],
    owner => root,
    group => hadoop,
    source  => "puppet:///modules/hadoop/hadoop-env.sh",
    mode => 644,
    before => Exec['initialize-hdfs'],
  }
  
  file { "/opt/hadoop-1.0.4/conf/core-site.xml" :
    require => [
      Exec["extract-hadoop-tar"],
    ],
    owner => root,
    group => hadoop,
    mode => 644,
    content => template("hadoop/core-site.erb"),
    before => Exec['initialize-hdfs'],
  }
  
  file { "/opt/hadoop-1.0.4/conf/hdfs-site.xml" :
    require => [
      Exec["extract-hadoop-tar"],
    ],
    owner => root,
    group => hadoop,
    mode => 644,
    source  => "puppet:///modules/hadoop/hdfs-site.xml",
    before => Exec['initialize-hdfs'],
  }
  
  file { "/opt/hadoop-1.0.4/conf/mapred-site.xml" :
    require => [
      Exec["extract-hadoop-tar"],
    ],
    owner => root,
    group => hadoop,
    mode => 644,
    content => template("hadoop/mapred-site.erb"),
    before => Exec['initialize-hdfs'],
  }


  #############
  # Init HDFS #
  #############

  exec { 'initialize-hdfs' :
    #path    => "/usr/bin",
    command => '/opt/hadoop-1.0.4/bin/hadoop namenode -format',
    creates => '/tmp/hadoop-root/dfs/name/current/VERSION',
    require => Exec["extract-hadoop-tar"],
  }

  exec{ 'start-hadoop':
    command => '/opt/hadoop-1.0.4/bin/start-all.sh',
    require => Exec["initialize-hdfs"],
    unless => '/bin/ps -efa | grep hadoop'
  }

   
}
