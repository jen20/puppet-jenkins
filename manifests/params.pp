# Class: jenkins::params
#
#
class jenkins::params {
  $version            = 'installed'
  $lts                = false
  $repo               = true
  $service_enable     = true
  $service_ensure     = 'running'
  $install_java       = true
  $swarm_version      = '1.9'
  $plugin_repo        = 'http://updates.jenkins-ci.org/download/plugins'
}


