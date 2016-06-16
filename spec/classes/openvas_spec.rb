require 'spec_helper'

describe 'openvas' do

  shared_examples 'no parameters' do
    let(:params) {{ }}

    it { should compile.with_all_deps }

    it { should create_class('openvas') }

    it { should contain_class('openvas::params') }
    it { should contain_class('openvas::repo').that_comes_before('Class[openvas::install]') }
    it { should contain_class('openvas::install').that_comes_before('Class[openvas::config]') }
    it { should contain_class('openvas::config') }
    it { should contain_class('openvas::service').that_subscribes_to('Class[openvas::config]') }

    it { should contain_service('openvas-manager').with(
      :ensure => 'running',
      :enable => 'true'
      )}

    it { should contain_service('openvas-scanner').with(
      :ensure => 'running',
      :enable => 'true'
      )}

    it { should contain_package('openvas').with_ensure('installed') }

    it {
        should contain_file_line('Disable Vulnerable Ciphers').with({
          :ensure => 'present',
          :line   => 'OPTIONS="--gnutls-priorities=SECURE128:+SECURE192:-VERS-TLS-ALL:+VERS-TLS1.2"',
          :match  => '^OPTIONS=.*',
          :path   => '/etc/sysconfig/openvas-scanner',
        }
      )
    }

    context 'with custom parameters' do
      context 'package name' do
        let(:params) {{ 'package_name' => 'custom-package' }}
        it { should contain_package("#{params['package_name']}") }
      end
      context 'manage service' do
        let(:params) {{ 'manage_service' => false }}
        it { should_not contain_service("openvas") }
      end
      context 'package version' do
        let(:params) {{ 'package_version' => 'latest' }}
        it { should contain_package('openvas').with_ensure('latest') }
      end
      context 'service name' do
        let(:params) {{ 'service_name_manager' => 'custom-service' }}
        it { should contain_service("#{params['service_name_manager']}") }
      end
    end
  end

  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts.merge({
          :fqdn => 'openvas.example.com',
          :path => '/usr/lib64/qt-3.3/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/bin:/root/bin'
        })
      end

      it_behaves_like 'no parameters'
    end
  end

end
