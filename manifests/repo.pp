# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include proxmox_backup::repo
class proxmox_backup::repo {

  #https://pbs.proxmox.com/docs/installation.html#proxmox-backup-no-subscription-repository

  file { '/etc/apt/trusted.gpg.d/proxmox-ve-release-6.x.gpg':
    ensure => 'present',
    source => 'http://download.proxmox.com/debian/proxmox-ve-release-6.x.gpg',
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

  ->apt::source { 'pbs':
    ensure   => 'present',
    comment  => 'Stable PBS repo',
    location => 'http://download.proxmox.com/debian/pbs',
    release  => 'buster',
    repos    => 'pbs-no-subscription',
    notify   => Class['apt::update'],
  }

  ~>exec { 'apt-full-upgrade':
    command     => '/usr/bin/apt full-upgrade -y',
    refreshonly => true,
    require     => Exec['apt_update'],
  }
}
