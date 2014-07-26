require 'spec_helper'

describe 'jenkins', :type => :module  do
  let(:facts) { { :osfamily => 'RedHat', :operatingsystem => 'RedHat' } }

  context 'plugins' do
    context 'default' do
      it { should contain_class('jenkins::plugins') }
    end

    context 'install plugin' do
      let(:params) { { :plugin_hash => { 'git' => { 'version' => '1.1.1' } } } }

      it { should contain_jenkins__plugin('git').with_version('1.1.1') }

      it do
        should contain_exec('create-pinnedfile-git').with(
          'command' => 'touch /var/lib/jenkins/plugins/git.jpi.pinned',
          'cwd' => '/var/lib/jenkins/plugins',
          'onlyif' => 'test -f /var/lib/jenkins/plugins/git.jpi -a ! -f /var/lib/jenkins/plugins/git.jpi.pinned'
        )
      end
    end

    context 'updating core plugin' do
      let(:params) { { :plugin_hash => { 'ldap' => { 'version' => '1.10.2' } } } }

      it { should contain_jenkins__plugin('ldap').with_version('1.10.2') }
      
      it do 
        should contain_exec('create-pinnedfile-ldap').with(
          'command' => 'touch /var/lib/jenkins/plugins/ldap.jpi.pinned',
          'cwd' => '/var/lib/jenkins/plugins',
          'onlyif' => 'test -f /var/lib/jenkins/plugins/ldap.jpi -a ! -f /var/lib/jenkins/plugins/ldap.jpi.pinned'
        )
      end
    end
  end

end
