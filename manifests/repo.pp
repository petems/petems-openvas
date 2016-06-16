# openvas::repo - Used for managing package repositories for openvas
#
class openvas::repo {

  if $::openvas::manage_repo {

    case $::osfamily {
      'RedHat': {
        case $::operatingsystem {
          'CentOS': {
            require ::openvas::repo::centos
          }
          default: {
            fail("This module does not support ${::operatingsystem} right now")
          }
        }
      }
      default: {
        fail("This module does not support ${::osfamily} right now")
      }
    }
  }
}
