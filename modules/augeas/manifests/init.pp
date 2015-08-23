class augeas {
file { 'augeas':
		ensure	=> file,
		path	=> '/root/augeas.sh',
		source	=> 'puppet:///modules/augeas/augeas.sh',
		mode	=> 0755,
		owner	=>	root,
		group	=>	root,
	}
	
exec { 'augeas-installer':
		refreshonly	=> true,
		command	=> '/root/augeas.sh',
		subscribe	=> File ['augeas'],
	}	
	
}