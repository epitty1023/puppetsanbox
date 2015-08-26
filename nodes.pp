#
# nodes.pp - defines all puppet nodes
#
stage { [pre, post]: }
Stage[pre] -> Stage[main] -> Stage[post]

# self-manage the puppet master server
node 'puppet' { 
class { 'augeas': }
}
##### CLIENTS###SERVERS######
### Client1
node 'client1' {
class { 'augeas': 
}
}
### Client2
node 'client2' { 
class {'augeas':}
#
class { 'tomcat': }
  tomcat::instance { 'default':
  install_from_source => false,
  package_name        => ['tomcat6','tomcat6-user','tomcat6-admin',],
}->
tomcat::config::server { 'tomcat6':
  catalina_base => '/var/lib/tomcat6',
  port          => '8105',
}->
tomcat::config::server::connector { 'tomcat6-http':
  catalina_base         => '/var/lib/tomcat6',
  port                  => '8180',
  protocol              => 'HTTP/1.1',
  additional_attributes => {
    'redirectPort' => '8543'
  },
}->
tomcat::config::server::connector { 'tomcat6-ajp':
  catalina_base         => '/var/lib/tomcat6',
  port                  => '8109',
  protocol              => 'AJP/1.3',
  additional_attributes => {
    'redirectPort' => '8543'
  },
}->
tomcat::service { 'default':
  use_jsvc     => false,
  use_init     => true,
  service_enable => true,
  service_name => 'tomcat6',
}->
tomcat::war { 'Calendar.war':
  catalina_base => '/var/lib/tomcat6',
  war_ensure => 'present',
  war_source => 'https://s3-us-west-1.amazonaws.com/tomcatwar/Calendar.war',
}
}