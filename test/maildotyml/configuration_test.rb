require 'test_helper'

describe Maildotyml::Configuration do
  def configuration
    @_configuration ||= Maildotyml::Configuration.new(fixture(fixture_name), environment)
  end

  def fixture_name
    'basic'
  end

  def environment
    'production'
  end

  describe 'basic production' do
    it 'parses delivery method' do
      configuration.delivery_method.must_equal :smtp
    end

    it 'parses settings' do
      configuration.settings.must_equal({
        domain: 'localhost.localdomain',
        address: 'localhost',
        port: 25,
      })
    end

  end

  describe 'basic test' do
    def environment
      'test'
    end

    it 'is present' do
      configuration.must_be :present?
    end

    it 'parses delivery method as a symbol' do
      configuration.delivery_method.must_equal :test
    end

    it 'parses settings' do
      configuration.settings.must_equal({})
    end
  end

  describe 'with erb' do
    before do
      ENV['TEST_ENV_USER_NAME'] = 'test_user_name'
      ENV['TEST_ENV_PASSWORD'] = 'test_password'
    end

    def fixture_name
      'erb'
    end

    it 'parses settings' do
      configuration.settings.must_equal({
        user_name: 'test_user_name',
        password: 'test_password',
        port: 25,
      })
    end
  end

  describe 'when the file does not exist' do
    def fixture_name
      'does-not-exist'
    end

    it 'is not present' do
      configuration.wont_be :present?
    end

    it 'parses delivery method as nil' do
      configuration.delivery_method.must_be_nil
    end

    it 'parses settings as an empty hash' do
      configuration.settings.must_equal({})
    end
  end

  describe 'when the environment does not exist' do
    def environment
      'something_else'
    end

    it 'is not present' do
      configuration.wont_be :present?
    end

    it 'parses delivery method as nil' do
      configuration.delivery_method.must_be_nil
    end

    it 'parses settings as an empty hash' do
      configuration.settings.must_equal({})
    end
  end
end
