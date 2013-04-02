
class ssh_keys {

  user { "hdfs":
    ensure     => present,
    managehome => true,
  }

  user { "hadoop":
    ensure     => present,
    managehome => true,
  }

  file { "/root/.ssh":
    ensure => "directory",
    owner  => "root",
    group  => "root",
    mode   => 700,
  }

  file { "/home/hdfs/.ssh":
    ensure => "directory",
    owner  => "hdfs",
    group  => "hdfs",
    mode   => 700,
  }

  file { "/home/hadoop/.ssh":
    ensure => "directory",
    owner  => "hadoop",
    group  => "hadoop",
    mode   => 700,
  }

  #############
  # Root Keys #
  #############
  file { "/root/.ssh/authorized_keys":
    owner   => root,
    group   => root,
    mode    => 600,
    source  => "puppet:///modules/ssh_keys/authorized_keys",
  }

  file { "/root/.ssh/id_rsa":
    owner   => root,
    group   => root,
    mode    => 600,
    source  => "puppet:///modules/ssh_keys/id_rsa",
  }

  file { "/root/.ssh/id_rsa.pub":
    owner   => root,
    group   => root,
    mode    => 644,
    source  => "puppet:///modules/ssh_keys/id_rsa.pub",
  }
  file { "/root/.ssh/known_hosts":
    owner   => root,
    group   => root,
    mode    => 644,
    source  => "puppet:///modules/ssh_keys/known_hosts",
  }

  #############
  # HDFS Keys #
  #############
  file { "/home/hdfs/.ssh/authorized_keys":
    owner   => hdfs,
    group   => root,
    mode    => 600,
    source  => "puppet:///modules/ssh_keys/authorized_keys",
  }

  file { "/home/hdfs/.ssh/id_rsa":
    owner   => hdfs,
    group   => hdfs,
    mode    => 600,
    source  => "puppet:///modules/ssh_keys/id_rsa",
  }

  file { "/home/hdfs/.ssh/id_rsa.pub":
    owner   => hdfs,
    group   => hdfs,
    mode    => 644,
    source  => "puppet:///modules/ssh_keys/id_rsa.pub",
  }

  file { "/home/hdfs/.ssh/known_hosts":
    owner   => hdfs,
    group   => hdfs,
    mode    => 644,
    source  => "puppet:///modules/ssh_keys/known_hosts",
  }


  ###############
  # Hadoop Keys #
  ###############
  file { "/home/hadoop/.ssh/authorized_keys":
    owner   => hadoop,
    group   => root,
    mode    => 600,
    source  => "puppet:///modules/ssh_keys/authorized_keys",
  }

  file { "/home/hadoop/.ssh/id_rsa":
    owner   => hadoop,
    group   => hadoop,
    mode    => 600,
    source  => "puppet:///modules/ssh_keys/id_rsa",
  }

  file { "/home/hadoop/.ssh/id_rsa.pub":
    owner   => hadoop,
    group   => hadoop,
    mode    => 644,
    source  => "puppet:///modules/ssh_keys/id_rsa.pub",
  }

  file { "/home/hadoop/.ssh/known_hosts":
    owner   => hadoop,
    group   => hadoop,
    mode    => 644,
    source  => "puppet:///modules/ssh_keys/known_hosts",
  }


}
