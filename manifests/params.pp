# openvas::params - Default parameters
class openvas::params {

  # OS Specific Defaults
  case $::osfamily {
    'RedHat': {

    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }

  # Defaults for all Operating Systems
  # (openvas has consistant naming accross OS's, hooray! :D)

  $manage_package   = true
  $manage_repo      = true
  $manage_service   = true
  $package_name     = 'openvas'
  $package_version  = 'installed'
  $port             = undef
  $service_ensure   = 'running'
  $service_name_manager = 'openvas-manager'
  $service_name_scanner = 'openvas-scanner'
  $configure_redis  = true

}
