# openvas::config - Used for managing config files for a openvas
#
class openvas::config {

  # Check script
  # Found https://svn.wald.intevation.org/svn/openvas/trunk/tools/openvas-check-setup
  file { '/opt/openvas-check-setup':
    ensure  => 'file',
    mode    => '0644',
    group   => '0',
    owner   => '0',
    content => template('openvas/opt/openvas-check-setup.erb'),
  }

  # Keeping it simple with config for now
  # Will add more options later
  file_line { 'Disable Vulnerable Ciphers':
    ensure => present,
    line   => 'OPTIONS="--gnutls-priorities=SECURE128:+SECURE192:-VERS-TLS-ALL:+VERS-TLS1.2"',
    match  => '^OPTIONS=.*',
    path   => '/etc/sysconfig/openvas-scanner',
  }

  file_line { 'Disable Vulnerable Ciphers':
    ensure => present,
    line   => 'GSA_ADDRESS=0.0.0.0',
    match  => '^GSA_ADDRESS=.*',
    path   => '/etc/sysconfig/gsad',
  }



}
