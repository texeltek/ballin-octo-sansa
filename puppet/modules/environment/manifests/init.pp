
class environment {
  
  file { '/etc/profile.d/environment.sh':
    ensure => present,
    source => "puppet:///modules/environment/environment.sh",
    owner  => "root",
    group  => "root",
    mode   => 644,
  }
}
