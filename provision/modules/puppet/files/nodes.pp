#
# nodes.pp - defines all puppet nodes
#
stage { [pre, post]: }
Stage[pre] -> Stage[main] -> Stage[post]

# self-manage the puppet master server
node 'puppet' { }

##### CLIENTS

node 'client1' {
  class { 'helloworld': }
}

node 'client2' { 
	class { 'tomcat': }
}