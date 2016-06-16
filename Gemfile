source 'http://rubygems.org'

group :test do
  if puppetversion = ENV['PUPPET_GEM_VERSION']
    gem 'puppet', puppetversion, :require => false
  else
    gem 'puppet', ENV['PUPPET_VERSION'] || '~> 3.8.0'
  end

  # rspec must be v2 for ruby 1.8.7
  if RUBY_VERSION >= '1.8.7' and RUBY_VERSION < '1.9'
    gem 'rspec', '~> 2.0'
  end

  gem 'rake'
  gem 'puppet-lint'
  gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet.git'
  gem 'puppet-syntax'
  gem 'puppetlabs_spec_helper'
  gem 'simplecov'
  gem 'metadata-json-lint'
  gem 'rspec-puppet-facts'
end

group :development do
  gem 'puppet-blacksmith'
  gem 'guard-rake'
  gem 'listen', '<= 3.0.6'
end

group :system_tests do
  gem 'beaker', '2.43.0'
  gem 'beaker-rspec', '5.3.0'
  gem "beaker-puppet_install_helper", :require => false
  gem 'vagrant-wrapper'
end
