require 'spec_helper'

describe 'openvas' do
  context 'on CentOS' do
    let(:facts) {{
      :osfamily                  => 'RedHat',
      :operatingsystemmajrelease => '7',
      :operatingsystem           => 'CentOS',
    }}

    context 'repo disabled' do
      let(:params) {{ 'manage_repo' => false }}
      it { should_not contain_yumrepo('extras') }
    end

    context 'repo enabled' do
      let(:params) {{ 'manage_repo' => true }}
      it { should contain_class('openvas::Repo::Centos')}

      it { should contain_yumrepo('atomic').with(
        :descr    => 'CentOS / Red Hat Enterprise Linux 7 - atomicrocketturtle.com',
        :enabled  => '1',
        :gpgcheck => '1',
        :gpgkey   => ["https://www.atomicorp.com/RPM-GPG-KEY.art.txt https://www.atomicorp.com/RPM-GPG-KEY.atomicorp.txt"],
        :mirrorlist  => "http://updates.atomicorp.com/channels/mirrorlist/atomic/centos-7-"
      )}
    end

  end
end
