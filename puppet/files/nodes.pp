# /etc/puppet/manifests/nodes.pp

node default {
  include ssh::server

  package { 'ntp': ensure => 'present' }
}

node slave inherits default {
  include puppet::agent
}

node puppet inherits default {  # this is the puppetmaster node
  include puppet::master
}

import '/etc/puppet/site/modules/nodes.pp'

# nodes.pp ends here
