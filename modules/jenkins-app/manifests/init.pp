class jenkins-app {
  file { "/var/lib/tomcat6/webapps/jenkins.war":
    owner => 'root',
    source => 'puppet:///modules/jenkins-app/jenkins.war',
  }
}