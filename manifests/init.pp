# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include proxmox_backup
class proxmox_backup {

  # Make sure the module is run on a debian 10
  if( $facts['os']['name'] != 'Debian' or $facts['os']['release']['major'] != '10' ) {
    fail('This modules only works on Debian 10 "buster"')
  }

  contain proxmox_backup::repo # Setup repo
  contain proxmox_backup::install

  Class['proxmox_backup::repo']
->Class['proxmox_backup::install']

}
