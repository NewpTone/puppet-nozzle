#
# Sets up nozzle users, service and endpoint
#
# == Parameters:
#
#  $auth_name :: identifier used for all keystone objects related to nozzle.
#    Optional. Defaults to nozzle.
#  $password :: password for nozzle user. Optional. Defaults to nozzle_password.
#  $service_type :: type of service to create. Optional. Defaults to image.
#  $public_address :: Public address for endpoint. Optional. Defaults to 127.0.0.1.
#  $admin_address :: Admin address for endpoint. Optional. Defaults to 127.0.0.1.
#  $inernal_address :: Internal address for endpoint. Optional. Defaults to 127.0.0.1.
#  $port :: Port for endpoint. Needs to match nozzle api service port. Optional.
#    Defaults to 9292.
#  $region :: Region where endpoint is set.
#
class nozzle::keystone::auth(
  $auth_name          = 'nozzle',
  $password           = 'nozzle',
  $configure_endpoint = true,
  $service_type       = 'loadbalance',
  $public_address     = '127.0.0.1',
  $admin_address      = '127.0.0.1',
  $internal_address   = '127.0.0.1',
  $port               = '5556',
  $region             = 'RegionOne'
) {

  Keystone_user["$auth_name"] ~> Keystone_user_role["${auth_name}@services"] ~> Service <| name == 'nozzle-server' |>
  Keystone_user["$auth_name"] ~> Keystone_user_role["${auth_name}@services"] ~> Service <| name == 'nozzle-api' |>

  keystone_user { $auth_name:
    ensure   => present,
    password => $password,
	tenant   => 'services',
  }
  keystone_user_role { "${auth_name}@services":
    ensure  => present,
    roles   => 'admin',
  }
  keystone_service { $auth_name:
    ensure      => present,
    type        => $service_type,
    description => "Openstack LoadBalance Service",
  }
  if $configure_endpoint {
    keystone_endpoint { $auth_name:
      ensure       => present,
      region       => $region,
      public_url   => "http://${public_address}:${port}/v1.0",
      admin_url    => "http://${admin_address}:${port}/v1.0",
      internal_url => "http://${internal_address}:${port}/v1.0",
    }
  }
}
