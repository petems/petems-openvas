require 'spec_helper_acceptance'

describe 'openvas class' do

  # Takes to long to setup to test the service...
  # Lets just check package and config
  context 'with manage_service false' do
    # Using puppet_apply as a helper
    it 'should work idempotently with no errors' do
      pp = <<-EOS
      class { '::openvas':
        manage_service => false,
      }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe package('openvas') do
      it { is_expected.to be_installed }
    end
  end

end
