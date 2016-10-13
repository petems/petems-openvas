# openvas::install - Used for managing packages for openvas
#
class openvas::initial_setup {

  include ::openvas::service

  exec { 'Create OpenVas client cert':
    command      => '/usr/sbin/openvas-mkcert-client -n -i',
  }
  ~>
  Service[$::openvas::service_name_scanner]

  exec { 'Run an openvasmd migration event':
    command      => '/usr/sbin/openvasmd --migrate',
  }
  ~>
  Service[$::openvas::service_name_manager]

  class { '::redis':
    unixsocket     => '/tmp/redis.sock',
    unixsocketperm => '700',
  }


}
