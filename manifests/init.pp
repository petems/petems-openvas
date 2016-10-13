# openvas - Used for managing installation and configuration
# of openvas (http://www.openvas.org/)
#
# @example
#   include openvas
#
# @example
#   class { 'openvas':
#     manage_repo    => false,
#     package_name   => 'openvas-custombuild',
#   }
#
# @author Peter Souter
#
# @param manage_package [Boolean] Whether to manage the openvas package
#
# @param manage_repo [Boolean] Whether to manage the package repositroy
#
# @param package_name [String] Name of the openvas package
#
# @param package_version [String] Version of the openvas package to install
#
# @param service_ensure [String] What status the service should be enforced to
#
# @param service_name [String] Name of the openvas service to manage
#
class openvas (
  $configure_redis  = $::openvas::params::configure_redis,
  $manage_package   = $::openvas::params::manage_package,
  $manage_repo      = $::openvas::params::manage_repo,
  $manage_service   = $::openvas::params::manage_service,
  $package_name     = $::openvas::params::package_name,
  $package_version  = $::openvas::params::package_version,
  $service_ensure   = $::openvas::params::service_ensure,
  $service_name_manager = $::openvas::params::service_name_manager,
  $service_name_scanner = $::openvas::params::service_name_scanner,
) inherits ::openvas::params {

  validate_bool($manage_package)
  validate_bool($manage_repo)
  validate_bool($manage_service)

  validate_string($package_name)
  validate_string($package_version)
  validate_string($service_ensure)
  validate_string($service_name_manager)
  validate_string($service_name_scanner)

  class { '::openvas::repo': } ->
  class { '::openvas::install': } ->
  class { '::openvas::config': } ~>
  class { '::openvas::service': } ->
  Class['::openvas']

  # Update packages on repo refresh
  Class['::openvas::repo'] ~>
  Class['::openvas::install']
}
