require 'spec_helper'

describe 'openvas' do
  context 'unsupported operating system' do
    context 'openvas class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('openvas') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
