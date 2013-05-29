require 'test_helper'
require 'ostruct'
require 'action_mailer'

describe Maildotyml do
  def settings
    { domain: 'localhost.localdomain', address: 'localhost', port: 25 }
  end

  def actionmailer
    ActionMailer::Base
  end

  def delivery_method
    :smtp
  end

  def configuration
    @_configuration ||= begin
      configuration = MiniTest::FireMock.new('Maildotyml::Configuration')
      configuration.expect(:present?, true)
      configuration.expect(:delivery_method, delivery_method)
      configuration.expect(:settings, settings)

      configuration
    end
  end

  describe 'when the adapter does not exist' do
    def delivery_method
      :bogus
    end

    it 'raises an error' do
      ->{ Maildotyml.configure(configuration, actionmailer) }.must_raise(ArgumentError)
    end
  end

  describe 'with basic configuration' do
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
