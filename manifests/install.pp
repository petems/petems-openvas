# openvas::install - Used for managing packages for openvas
#
class openvas::install {

  if $::openvas::manage_package {
    package { $::openvas::package_name:
      ensure => $::openvas::package_version,
    }
  }
}
