echo 'deb  http://pkg.camptocamp.net/apt wheezy/stable sysadmin' | sudo tee -a /etc/apt/sources.list
apt-get install -y curl
curl -s http://pkg.camptocamp.net/packages-c2c-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-cache madison "augeas*" | grep camptocamp libaugeas-ruby1.8 | 0.5.0-0c2c1 | http://pkg.camptocamp.net/apt/wheezy/stable/sysadmin amd64 Packages augeas-tools | 1.3.0-0+c2c1 | http://pkg.camptocamp.net/apt/ wheezy/stable/sysadmin amd64 Packages
sudo apt-get install -y augeas-tools=1.\* augeas-lenses=1.\* augeas-doc=1.\* libaugeas0=1.\*


