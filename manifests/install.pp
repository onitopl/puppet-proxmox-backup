# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include proxmox_backup::install
class proxmox_backup::install {

  Class['apt::update'] -> Package <| provider == 'apt' |>

  package { ['proxmox-backup']:
    ensure => 'installed',
    notify => Reboot['proxmox_backup_install'],
  }

  reboot { 'proxmox_backup_install':
      apply =>  finished,
  }

}
