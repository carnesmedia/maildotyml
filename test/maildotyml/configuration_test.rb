require 'test_helper'

describe Maildotyml::Configuration do

  describe 'basic production' do
    it 'parses delivery method' do
      configuration = Maildotyml::Configuration.new(fixture('basic'), 'production')
      configuration.delivery_method.must_equal :smtp
    end

    it 'parses settings' do
      configuration = Maildotyml::Configuration.new(fixture('basic'), 'production')
      configuration.settings.must_equal({
        domain: 'localhost.localdomain',
        address: 'localhost',
        port: 25,
      })
    end

  end

  describe 'basic test' do
    it 'parses delivery method' do
      configuration = Maildotyml::Configuration.new(fixture('basic'), 'test')
      configuration.delivery_method.must_equal :test
    end

    it 'parses settings' do
      configuration = Maildotyml::Configuration.new(fixture('basic'), 'test')
      configuration.settings.must_equal({})
    end
  end

  describe 'with erb' do
    before do
      ENV['TEST_ENV_USER_NAME'] = 'test_user_name'
      ENV['TEST_ENV_PASSWORD'] = 'test_password'
    end

    it 'parses settings' do
      configuration = Maildotyml::Configuration.new(fixture('erb'), 'production')
      configuration.settings.must_equal({
        user_name: 'test_user_name',
        password: 'test_password',
        port: 25,
      })
    end

  end
end
