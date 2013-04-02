
class java {

  package { "java":
    ensure => 'installed',
    name   => 'java-1.6.0-openjdk-devel.x86_64',
  }


  #################################
  # Steps to install oracle's jvm #
  #################################

  # exec { 'Download-Java-RPM':
  #   path => '/tmp',
  #   command => "/usr/bin/wget --no-cookies --header 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2Ftechnetwork%2Fjava%2Fjavase%2Fdownloads%2Fjdk-7u3-download-1501626.html;' http://download.oracle.com/otn-pub/java/jdk/7u17-b02/jdk-7u17-linux-x64.rpm -O /tmp/jdk-7u17-linux-x64.rpm",
  #   before => Package['java'],
  #   creates => '/tmp/jdk-7u17-linux-x64.rpm',
  # }

  # package { "java":
  #   provider => rpm,
  #   ensure   => installed,
  #   source => '/tmp/jdk-7u17-linux-x64.rpm',
  #   # require => Exec['Download-Java-RPM'],
  #   notify => [
  #     exec['Alternatives-Install'],
  #     exec['Alternatives-Auto'],
  #   ],
  # }

  # exec { 'Alternatives-Install':
  #   path => '/usr/sbin',
  #   command => 'alternatives --install /usr/bin/java java /usr/java/latest/bin/java 1600',
  #   creates => '/etc/alternatives/java',
  # }

  # exec { 'Alternatives-Auto':
  #   path => '/usr/sbin',
  #   command => 'alternatives --auto java',
  # }

}
