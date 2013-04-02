class maven {
  
  exec { 'download-maven':
    command => '/usr/bin/wget http://mirror.symnds.com/software/Apache/maven/maven-3/3.0.5/binaries/apache-maven-3.0.5-bin.tar.gz -O /tmp/apache-maven-3.0.5-bin.tar.gz',
    creates => '/tmp/apache-maven-3.0.5-bin.tar.gz',
    before  => Exec['extract-maven-tar'],
  }


  exec { 'extract-maven-tar':
    cwd => '/opt',
    command => '/bin/tar -zxvf /tmp/apache-maven-3.0.5-bin.tar.gz',
    creates => '/opt/apache-maven-3.0.5',
    before => File['/opt/apache-maven-3.0.5/conf/settings.xml'],
  }


  file{ "/opt/apache-maven-3.0.5/conf/settings.xml":
    require => Exec['extract-maven-tar'],
    owner => root,
    group => root,
    source => "puppet:///modules/maven/settings.xml",
    mode => 644,
  }

}
