require 'test_helper'
require 'ostruct'

describe Maildotyml do

  describe 'with basic configuration' do
    def settings
      { domain: 'localhost.localdomain', address: 'localhost', port: 25 }
    end

    def actionmailer
      @_actionmailer ||= OpenStruct.new
    end

    def configuration
      @_configuration ||= begin
        configuration = MiniTest::FireMock.new('Maildotyml::Configuration')
        configuration.expect(:present?, true)
        configuration.expect(:delivery_method, :smtp)
        configuration.expect(:delivery_method, :smtp)
        configuration.expect(:settings, settings)

        configuration
      end
    end

    before do
      Maildotyml.configure(configuration, actionmailer)
    end

    after do
      configuration.verify
    end

    it 'sets the correct delivery_method on actionmailer' do
      actionmailer.delivery_method.must_equal :smtp
    end

    it 'sets the correct settings on actionmailer' do
      actionmailer.smtp_settings.must_equal settings
    end
  end

  describe 'when the configuration is not present' do
    it 'does nothing (no error, no configuration)' do
      actionmailer = MiniTest::Mock.new
      configuration = MiniTest::FireMock.new('Maildotyml::Configuration')
      configuration.expect(:present?, false)

      Maildotyml.configure(configuration, actionmailer)

      # Actionmailer should have nothing called
      actionmailer.verify
    end
  end

end
