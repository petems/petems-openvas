# openvas::repo - Used for managing the openvas service
#
class openvas::service {

  if $::openvas::manage_service {
    service { $::openvas::service_name_manager:
      ensure => $::openvas::service_ensure,
      enable => true,
    }

    service { $::openvas::service_name_scanner:
      ensure => $::openvas::service_ensure,
      enable => true,
    }
  }
}
